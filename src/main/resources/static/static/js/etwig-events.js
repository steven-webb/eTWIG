/**
 	* eTWIG - The event management software for Griffin Hall.
 	* @copyright: Copyright (c) 2024 Steven Webb (Social Media Representative)
 	* @license: MIT
 	* @author: Steven Webb [xiaoancloud@outlook.com]
 	* @website: https://etwig.grinecraft.net
 	* @function: Add, edit and delete events.
 	*/

/**
 * Validate the add event form. If passed, add the event.
 * @param embedded True if the event add page is in the "embed" mode, i.e., this page is in the frame of the calendar. 
 * 					The modal should be closed after operation.
 * 					False otherwise. The page should refresh after operation.
 * @param isEdit True the mode is edit event, other the mode is add event.
 */

function addEvent(embedded, isEdit){
	
	// Event id: Required in edit mode.
	var eventId = $('#eventId').val();
	if(isEdit && eventId.length == 0){
		warningToast("Event id is required in edit mode.");
		return;
	}
	
	// Event name: Required
	var eventName = $.trim($('#eventName').val());
	if(eventName.length == 0){
		warningToast("Event name is required.");
		return;
	}
	
	// Event location: Optional
	var eventLocation = $.trim($('#eventLocation').val());
	
	// Event description: Optional
	var eventDescription = $("#eventDescription").summernote("code");
	
	// Event time unit: Required
	var eventTimeUnit = $('input[type=radio][name=eventTimeUnit]:checked').val();
	
	// Event startTime: Required
	var eventStartTime = $('#eventStartTime').val();
	var parsedStartTime = Date.parse(eventStartTime);
	
	if(eventStartTime.length == 0){
		warningToast("Event start time is required");
		return;
	}
	
	if(parsedStartTime == null){
		warningToast("Event start time is not well-formed.");
		return;
	}
	
	// Event duration: Required only if the eventTimeUnit is not "customize""
	var eventDuration = $('#eventDuration').val();
	var realDuration = 0;
	
	// Event endTime: Required only if the eventTimeUnit is "customize""
	var eventEndTime = $('#eventEndTime').val();
	var parsedEndTime = Date.parse(eventEndTime);
	
	// Check "Duration" / "End Time" by selected time units.
	if(eventTimeUnit == "c"){
		
		if(eventEndTime.length == 0){
			warningToast("Event end time is required");
			return;
		}
		
		if(parsedEndTime == null){
			warningToast("Event end time is not well-formed.");
			return;
		}
		
		var timestampDiff = parsedEndTime.getTime() - parsedStartTime.getTime();
		if(timestampDiff <= 0){
			warningToast("Event end time must after start time.");
			return;
		}
		
		// timestampDiff unit is millisecond, realDuration unit is minute
		realDuration = timestampDiff / 60000;
	}
	
	else{
		if(eventDuration.length == 0){
			warningToast("Event duration is required, and it must be a number.");
			return;
		}
		
		if(eventDuration <= 0){
			warningToast("Event duration must be a positive number.");
			return;
		}
		realDuration = eventDuration;
	}
	
	// Event portfolio: Required
	var eventPortfolio = $('#eventPortfolio').find(":selected").val();
	
	// Event Organizer: Required
	var eventOrganizer = $('#eventOrganizer').find(":selected").val();

	// Properties 
	var selectedProperties = [];
	var mandatoryCheckPassed = true;
	
	$('.property-select-box').each(function() {
    	//var propertyId = $(this).data('property-id');
    	var propertyName = $(this).data('property-name');
    	var isMandatory = $(this).data('mandatory');
    	var selectedValue = $(this).val();

		// Mandatory check
		if(isMandatory && selectedValue <= 0){
			warningToast("Selecting a value for property " + propertyName + " is required.");
			mandatoryCheckPassed = false;
			//return;
		}
		
		// Only store the positive optionIds.
		if(selectedValue > 0){
			selectedProperties.push(selectedValue);
		}
	});
	
	if(!mandatoryCheckPassed){
		return;
	}
	
	// Create an object for the new event.
	var newEventObj = {
		"eventId" : eventId,
		"isRecurrent": false,
		"name": eventName,
		"location": eventLocation,
		"description": eventDescription,
		"timeUnit": eventTimeUnit,
		"startTime": eventStartTime,
		"duration": realDuration,
		"portfolio": eventPortfolio,
		"organizer": eventOrganizer,
		"properties": selectedProperties
	};
	
	// POST the new (or changed) event into the event add/edit API
	var url = isEdit ? "/api/private/editEvent" : "/api/private/addEvent";
	var mode =  isEdit ? "edit" : "add";
	
	var hasError = true;
	$.ajax({
   		url: url, 
   		type: "POST",
   		async: false,
   		dataType: "json",
   		contentType: "application/json; charset=utf-8",
   		data: JSON.stringify(newEventObj),
   		success: function (result) {
			if(result.error > 0){
				dangerToast("Failed to " + mode +" event.", result.msg);
				hasError = true;
			}else{
				successToast("Event  " + mode +"ed  successfully.");
				hasError = false;
			}	
    	},
    	error: function (err) {
    		dangerToast("Failed to  " + mode +"  event due to a HTTP " + err.status + " error.", err.responseJSON.exception);
    		hasError = true;
    	}
 	});

	// Post-add operations
	// More timeout if error happens.
	setTimeout(
		function() {
			embedded ? parent.location.reload() : window.location.reload();
		}, 
		hasError ? 5000 : 2000
	);
}

/**
 * Create a WYSIWYG editor by using summernote.
 * @param boxElem The HTML element for this editor.
 */

function initDescriptionBox(boxElem){
	$(boxElem).summernote({
		placeholder: 'Event description',
        tabsize: 4,
        height: 200,
        minHeight: 200,
  		maxHeight: 500,
  		toolbar: [
  			['style', ['style']],
  			['font', ['bold', 'underline', 'clear']],
  			['fontname', ['fontname']],
  			['color', ['color']],
  			['para', ['ul', 'ol', 'paragraph']],
  			['table', ['table']],
  			['insert', ['link']],
  			['view', ['fullscreen', 'help']],
		]
	});
}

/**
 * Change timing options based on time units
 * @param startTimePicker The ToastUI datepicker element of the start time.
 */

function timeUnitBtnOnChange(startTimePicker){
	$('input[type=radio][name=eventTimeUnit]').change(function() {
		
		// Custom time unit: input a specific end time. Otherwise, input a time range with appropriate duration.
		if(this.value == "c"){
			$("#durationInput").hide();
			$("#endTimeInput").show();
		}else{
			$("#durationInput").show();
			$("#endTimeInput").hide();
		}
		
		// Always set the default time to "12 AM".
		var timePicker = startTimePicker.getTimePicker();
		timePicker.setTime(0, 0);
		
		// Change some values based on the choices.
		switch (this.value){
			
			// Hour
			case "h":
				$('#unitText').text("Hour(s)");
				startTimePicker.setType("date");
				timePicker.show();
				break;
			
			// Day
			case "d":
				$('#unitText').text("Day(s)");
				startTimePicker.setType("date");
				timePicker.hide();
				break;	
				
			// Week
			case "w":
				$('#unitText').text("Week(s)");
				startTimePicker.setType("date");
				timePicker.hide();
				break;	
				
			// Month
			case "m":
				$('#unitText').text("Month(s)");
				startTimePicker.setType("month");
				timePicker.hide();
				break;

			// Custom
			default:
				startTimePicker.setType("date");
				timePicker.show();
				break;	
		}
	});
}

/**
 * Create ToastUI date picker
 * @param htmlElem The element of datepicker wrapper.
 * @param pickerElem The element of date input.
 * @param type The picker type.
 * @param format Time format.
 * @returns The created datepicker element.
 */

function createDatePicker(htmlElem, pickerElem, type, format){

	// Create the date picker
	var datepicker = new tui.DatePicker(htmlElem, {
		date: Date.today(),
		type: type,
		input: {
			element: pickerElem,
			format: format,
			usageStatistics: false
		},
		timePicker: {
          inputType: 'spinbox'
        },
	});
	return datepicker;
}

/**
 * Enable the "delete event" button when click the confirmation checkbox.
 */

function deleteEventCheckboxOnChange(){
	$('#confirmDeletion').change(function() {
		$('#deleteEventBtn').prop('disabled', !this.checked);
    });
}
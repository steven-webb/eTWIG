<#-- 
	eTWIG - The event management software for Griffin Hall.
	copyright: Copyright (c) 2024 Steven Webb (Social Media Representative)
	license: MIT
	author: Steven Webb [xiaoancloud@outlook.com]
	website: https://etwig.grinecraft.net
	function: The template for add/edit events, properties part.
	This part contains the form of timing, including event start/end time and duration.
   -->

   						<#-- Timing -->
						<div class="container-fluid">
							<div class="row col-12">

								<#-- Col 1 -->
								<div class="col-md-6">

									<#-- Recurrent -->
									<div class="form-group row">
										<label for="event-recurrent" class="col-sm-2 col-form-label">
											Recurrent&nbsp;<span class="required-symbol">*</span>
										</label>
										<div class="col-sm-10">
											<div class="form-group clearfix">
												<div class="icheck-primary">
													<input type="radio" id="single-time-event" name="event-recurrent" checked="">
													<label for="single-time-event">Single Time</label>
												</div>
												<div class="icheck-primary">
													<input type="radio" id="recurring-event" name="event-recurrent">
													<label for="recurring-event">Recurring</label>
												</div>
											</div>				
											
											<#if !disabled>
												<#if isEdit>
													<div class="callout callout-warning">
														<h5 class="bold-text mb-3">Recurrent Option Disabled</h5>
														You cannot change the recurrent option for an existing event. If you want to do so, please delate the event and create a new event.
													</div>
												<#else>
													<div class="callout callout-primary">
														<h5 class="bold-text mb-3">Be Careful!</h5>
														Once you set the recurrent option, it cannot be changed unless you delete the event completely, then add a new event.
													</div>
												</#if>
											</#if>
										</div>
									</div>
									<#-- /Recurrent -->

									<#-- All day event -->
									<div class="form-group row">
										<label for="eventAllDayEvent" class="col-sm-2 col-form-label">
											All day event&nbsp;<span class="required-symbol">*</span>
										</label>
										<div class="col-sm-10">
											<div class="icheck-primary">
  												<input type="checkbox" id="eventAllDayEvent" name="eventAllDayEvent">
              									<label for="eventAllDayEvent">All day event</label>
											</div>
											<small class="form-text text-muted">If this event as lasting the entire day, enable the checkbox.</small>
										</div>
									</div>
									<#-- /All day event -->

								</div>
								<#-- /Col 1 -->

								<#-- Col 2 -->
								<div class="col-md-6">

									<div id="singleTimeEventOptions">
									1
									</div>

									<div id="recurringEventOptions">
									2
									</div>

								</div>
								<#-- /Col 2 -->

							</div>
						</div>

						<#--
						<div class="form-group row">
									<label for="eventTimeUnit" class="col-sm-2 col-form-label">
										Time Unit&nbsp;<span class="required-symbol">*</span>
									</label>
									<div class="col-sm-10">
										<div class="form-group clearfix">
										
											<#-- Hour
											<div class="icheck-primary">
												<input type="radio" id="hour" name="eventTimeUnit" <#if timeUnit == "h">checked</#if> value="h" ${disabledStr}>
												<label for="hour">Hour</label>
											</div>
											
											<#-- Day
											<div class="icheck-primary">
												<input type="radio" id="day" name="eventTimeUnit" <#if timeUnit == "d">checked</#if> value="d" ${disabledStr}>
												<label for="day">Day [00:00-23:59]</label>
											</div>
											
											<#-- Week
											<div class="icheck-primary">
												<input type="radio" id="week" name="eventTimeUnit" <#if timeUnit == "w">checked</#if> value="w" ${disabledStr}>
												<label for="week">Week [00:00 Mon-23:59 Sun]</label>
											</div>
											
											<#-- Month
											<div class="icheck-primary">
												<input type="radio" id="month" name="eventTimeUnit" <#if timeUnit == "m">checked</#if> value="m" ${disabledStr}>
												<label for="month">Month [00:00 1st day-23:59 last day]</label>
											</div>
											
											<#-- Customize
											<div class="icheck-primary">
												<input type="radio" id="customize" name="eventTimeUnit" <#if timeUnit == "c">checked</#if> value="c" ${disabledStr}>
												<label for="customize">Custom</label>
											</div>
										</div>
									</div>
								</div>
								
								<#-- Start Time 
								<div class="form-group row">
									<label for="eventStartTime" class="col-sm-2 col-form-label">
										Start Time&nbsp;<span class="required-symbol">*</span>
									</label>
									<div class="col-sm-10">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text">
													<i class="fa-solid fa-hourglass-start"></i>
												</span>
											</div>
											<input type="text" class="form-control" placeholder="Event Start Time" id="eventStartTime" ${disabledStr}>
										</div>
										<div id="eventStartWrapper" class="datepicker"></div>
									</div>
								</div>					
								
								<#-- Duration 
								<div class="form-group row" id="durationInput" <#if durationHidden>style="display:none;"</#if>>
									<label for="eventDuration" class="col-sm-2 col-form-label">
										Duration&nbsp;<span class="required-symbol">*</span>
									</label>
									<div class="col-sm-10">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text">
													<i class="fa-solid fa-hourglass-half"></i>
												</span>
											</div>
											<input type="number" min="0" class="form-control" placeholder="Event Duration" id="eventDuration" value="${duration}" ${disabledStr}>
											<div class="input-group-append">
												<span class="input-group-text" id="unitText">Hour(s)</span>
											</div>
										</div>
									</div>
								</div>
								
								<#-- End Time 
								<div class="form-group row" id="endTimeInput" <#if !durationHidden>style="display:none;"</#if>>
									<label for="eventEndTime" class="col-sm-2 col-form-label">
										End Time&nbsp;<span class="required-symbol">*</span>
									</label>
									<div class="col-sm-10">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text">
													<i class="fa-solid fa-hourglass-end"></i>
												</span>
											</div>
											<input type="text" class="form-control" placeholder="Event End Time" id="eventEndTime" <#if isEdit && !editPermission>disabled</#if>>
										</div>
										<div id="eventEndWrapper" class="datepicker"></div>
									</div>
								</div>			
								<#-- /End Time 
								
								<#-- Calculated 
								<#-- 
								<div class="form-group row">
									<label for="eventCalculatedTime" class="col-sm-2 col-form-label">Calculated Times</label>
									<div class="col-sm-10 table-responsive">				
										<table class="table table-bordered">
  											<thead>
    											<tr>
      												<th scope="col">Start</th>
      												<th scope="col">Duration</th>
      												<th scope="col">End</th>
    											</tr>
  											</thead>
  											<tbody>
												<tr>
      												<td>Null</td>
      												<td>Null</td>
      												<td>Null</td>
    											</tr>
  											</tbody>
										</table>
										
									</div>
								</div>		
								
							</div>
						</div>
						-->
package net.grinecraft.etwig.services;

import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.grinecraft.etwig.model.Event;
import net.grinecraft.etwig.model.User;
import net.grinecraft.etwig.model.Portfolio;
import net.grinecraft.etwig.model.SingleTimeEvent;
import net.grinecraft.etwig.repository.EventRepository;
import net.grinecraft.etwig.repository.SingleTimeEventRepository;
import net.grinecraft.etwig.util.DataIntegrityViolationException;
import net.grinecraft.etwig.util.DateUtils;
import net.grinecraft.etwig.util.NameUtils;
import net.grinecraft.etwig.util.type.DateRange;

@Service
public class EventService {

	@Autowired
	private EventRepository eventRepository;
	
	@Autowired
	private SingleTimeEventRepository singleTimeEventRepository;
	
	/**
	 * Get all events that happens in the month/week/day of the given date.
	 * @param givenDate
	 * @return The hashmap of all required events.
	 */
	
	public LinkedHashMap<Long,Object> findByDateRange(LocalDate givenDate, DateRange dateRange){
		
		// Step 1: Date check
		LocalDate last = null;
		LocalDate next = null;
		
		if(dateRange == DateRange.MONTH) {
			last = DateUtils.findFirstDayOfThisMonth(givenDate);
			next = DateUtils.findFirstDayOfNextMonth(givenDate);
		}
		
		else if(dateRange == DateRange.WEEK) {
			last = DateUtils.findThisMonday(givenDate);
			next = DateUtils.findNextMonday(givenDate);
		}
		
		else {
			last = givenDate;
			next = DateUtils.findTomorrow(givenDate);
		}
		
		//if(singleTimeEventRepository == null) {
		//	return new LinkedHashMap<Long, Object>();
		//}
		
		// Step 2 
		
		/*
        List<SingleTimeEvent> singleTimeEventsList = singleTimeEventRepository.findByDateRange(currentMonday, nextMonday);
      
        LinkedHashMap<Long, Object> allEvents = new LinkedHashMap<>();
        for(SingleTimeEvent singleTimeEvents : singleTimeEventsList) {      	
        	//allPortfolios.put(portfolio.getPortfolioID(), portfolioObjectToMap(portfolio));
        	
        	Long eventId = Long.valueOf(singleTimeEvents.getId());
        	LinkedHashMap<String, Object> info = new LinkedHashMap<String, Object>();
        	info.put("eventId", eventId);
        	info.put("eventName", singleTimeEvents.getName());
        	info.put("eventLocation", singleTimeEvents.getLocation());
        	info.put("eventStartTime", singleTimeEvents.getStartDateTime());
        	info.put("eventDuration", singleTimeEvents.getDuration());
        	info.putAll(getEventDetailsById(eventId, false));
        	//System.out.println(info);
        	
        	allEvents.put(eventId, info);
        }*/
        
        return null;
		
	}
	
	
	/**
	 * Get all details related to a single time event by it's id.
	 * @param id The id of that event.
	 * @param showAllDetails True to show all details, false to show brief information.
	 * @return A linkedHaskMap about the details of the event. If event doesn't exist, return null.
	 * @throws DataIntegrityViolationException If the violation of the data integrity is detected.
	 */
	
	public LinkedHashMap<String, Object> getSingleTimeEventDetailsById(long id, boolean showAllDetails) {
		LinkedHashMap<String, Object> eventDetails = new LinkedHashMap<String, Object>();
		
		// Step 1: Null check (to avoid NullPointerException on findById)
		if(singleTimeEventRepository == null) {
			return null;
		}
		
		// Step 2: Find in the event table (join with portfolio and users table).
		Optional<SingleTimeEvent> singleTimeEventOptional = singleTimeEventRepository.findById(id);
		
		// Step 2.1: Null check
		if (!singleTimeEventOptional.isPresent()){
			return null;
		}
		
		// Step 2.2: Gather required objects and date integrity check
		SingleTimeEvent singleTimeEvent = singleTimeEventOptional.get();
		Event event = singleTimeEvent.getEvent();
		
		if(event == null) {
			throw new DataIntegrityViolationException("The event id=" + singleTimeEvent.getId() + " exists in event_single_time table but doesn't exist in event table.");
		}
		
		Portfolio portfolio = event.getPortfolio();
		User user = event.getUser();
		
		if(portfolio == null) {
			throw new DataIntegrityViolationException("The portfolio of event id=" + singleTimeEvent.getId() + " doesn't exist. PLease check the portfolio table.");
		}
		
		if(user == null) {
			throw new DataIntegrityViolationException("The organizer of event id=" + singleTimeEvent.getId() + " doesn't exist. PLease check the leader table.");
		}
		
		// Step 2.4: Add all necessary data
		eventDetails.put("eventName", singleTimeEvent.getName());
		eventDetails.put("eventStartTime", singleTimeEvent.getStartDateTime());
		eventDetails.put("eventDuration", singleTimeEvent.getDuration());
		
		// Just output the overriding event id. Let the front-end to handle this.
		eventDetails.put("overRideRecurringEvent", singleTimeEvent.getOverrideRecurringEvent());
		eventDetails.put("portfolioColor", portfolio.getColor());
			
		// Step 2.5: Add all detailed data
		if(showAllDetails) {
			eventDetails.put("eventLocation", singleTimeEvent.getLocation());
			eventDetails.put("eventDescription", singleTimeEvent.getDescription());
			eventDetails.put("portfolioName", portfolio.getName());
			eventDetails.put("portfolioAbbreviation", portfolio.getAbbreviation());
			eventDetails.put("portfolioIcon", portfolio.getIcon());
			eventDetails.put("organizerName", NameUtils.nameMerger(user.getFirstName(), user.getMiddleName(), user.getLastName()));
		}
		// TODO Find all parents
		
		return eventDetails;
	}
}

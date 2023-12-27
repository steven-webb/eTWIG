package net.grinecraft.etwig.controller.api;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import net.grinecraft.etwig.services.EventService;
import net.grinecraft.etwig.util.WebReturn;

@RestController
public class EventsEditAPIController {

	@Autowired
	EventService eventService;
	
	@RequestMapping(value = "/api/addEvent", method = RequestMethod.POST)
    public Map<String, Object> addEvent(@RequestBody Map<String, Object> eventInfo) {
        System.out.println(eventInfo);
        
        //String timeUnit = eventInfo.get("timeUnit").toString();
        //System.out.println(timeUnit);
        
        //EventTimeUnit eventUnit = EventTimeUnit.fromString(timeUnit);
        
        //System.out.println(eventUnit);
       
        
        eventService.addEvent((LinkedHashMap<String, Object>) eventInfo);
        
        return WebReturn.errorMsg(null, true);
    }
}
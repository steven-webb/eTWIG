package net.grinecraft.etwig.controller.publicPages;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import net.grinecraft.etwig.services.PortfolioService;
import net.grinecraft.etwig.util.NumberUtils;

@RestController
public class PortfolioAPIController {
	
	@Autowired
	PortfolioService portfolioService;
	
	@RequestMapping("/public/_getPortfolioList")  
	public Map<Integer, Object> getPortfolioList() throws Exception{
		return portfolioService.getPortfolioList();  
	}
	
	@RequestMapping("/public/_getPortfolioById")  
	public Map<String, Object> getPortfolioById(@RequestParam(required = false) String portfolioID) throws Exception{
	    
		Map<String, Object> myReturn = new LinkedHashMap<String, Object>();
		
	    // Check input first!
	    if(!NumberUtils.isLong(portfolioID)) {
	    	myReturn.put("code", 1);
	    	myReturn.put("msg", "portfolioID parameter is either missing or invalid. It must be a positive integer.");
	    	myReturn.put("portfolio", new LinkedHashMap<String, Object>());
	    }else {
	    	myReturn.put("code", 0);
	    	myReturn.put("msg", "success.");
	    	myReturn.put("portfolio", portfolioService.getPortfolioById(Long.parseLong(portfolioID)));
	    }
	    
	    return myReturn;
	}
}

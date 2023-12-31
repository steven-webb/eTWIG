/**
 	* eTWIG - The event management software for Griffin Hall.
 	* @copyright: Copyright (c) 2024 Steven Webb (Social Media Representative)
 	* @license: MIT
 	* @author: Steven Webb [xiaoancloud@outlook.com]
 	* @website: https://etwig.grinecraft.net
 	* @function: The controller for all public TWIG related APIs.
 	*/

package net.grinecraft.etwig.controller.api;

import java.time.LocalDate;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import net.grinecraft.etwig.services.TwigService;
import net.grinecraft.etwig.services.WeekService;
import net.grinecraft.etwig.util.DateUtils;
import net.grinecraft.etwig.util.NumberUtils;
import net.grinecraft.etwig.util.WebReturn;
import net.grinecraft.etwig.util.type.DateRange;

@RestController
public class TwigAPIController {

	@Autowired
	TwigService twigService;
	
	@Autowired
	WeekService weekService;

	/**
	 * Get the TWIG template by a specific given id.
	 * @param eventId The ID of the template
	 * @return
	 * @throws Exception
	 * @authentication False
	 */
	
	@RequestMapping("/api/public/getTwigTemplateById")  
	public Map<String, Object> getTwigTemplateById(@RequestParam String templateId) throws Exception{
		Long templateIdNum = NumberUtils.safeCreateLong(templateId);

		if(templateIdNum == null) {
			return WebReturn.errorMsg("templateId is invalid. It must be an Integer.", false);
		} 
			
		Map<String, Object> myReturn = WebReturn.errorMsg(null, true);
	    myReturn.put("template", twigService.getTwigTemplateById(templateIdNum));
		
		return myReturn;
	}

	/**
	 * Get the "week" information by a given date.
	 * @param date The given date in yyyy-mm-dd format.
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping("/api/public/getWeekByDate")  
	public Map<String, Object> getWeekByDate(@RequestParam String date) throws Exception{
		
		LocalDate givenDate = DateUtils.safeParseDate(date, "yyyy-MM-dd");
		if(givenDate == null) {
			return WebReturn.errorMsg("date is invalid. It must be yyyy-mm-dd.", false);
		}
		
		Map<String, Object> myReturn = WebReturn.errorMsg(null, true);
	    myReturn.put("week", weekService.getWeekByDate(givenDate));
		return myReturn;
	}
	
	@RequestMapping("/api/public/getTwigTemplateByPortfolioAndDate")  
	public Map<String, Object> getTwigTemplateByPortfolioAndDate(@RequestParam String portfolioId, @RequestParam String date) throws Exception{

		Long portfolioIdNum = NumberUtils.safeCreateLong(portfolioId);
		LocalDate givenDate = DateUtils.safeParseDate(date, "yyyy-MM-dd");
		
		if(portfolioIdNum == null) {
			return WebReturn.errorMsg("portfolioId is invalid. It must be an Integer.", false);
		} 
		
		if(givenDate == null) {
			return WebReturn.errorMsg("date is invalid. It must be yyyy-mm-dd.", false);
		}
		
		Map<String, Object> myReturn = WebReturn.errorMsg(null, true);
	    myReturn.put("template", twigService.getTwigTemplateByDateAndPortfolio(givenDate, portfolioIdNum));
		
		return myReturn;
	}
	
}

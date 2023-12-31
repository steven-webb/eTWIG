/**
 	* eTWIG - The event management software for Griffin Hall.
 	* @copyright: Copyright (c) 2024 Steven Webb (Social Media Representative)
 	* @license: MIT
 	* @author: Steven Webb [xiaoancloud@outlook.com]
 	* @website: https://etwig.grinecraft.net
 	* @function: The controller for the error pages.
 	*/

package net.grinecraft.etwig.controller;

import java.util.Map;

import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.boot.web.error.ErrorAttributeOptions;

@Controller
public class EtwigErrorController implements ErrorController {
	
    private final ErrorAttributes errorAttributes;

    public EtwigErrorController(ErrorAttributes errorAttributes) {
        this.errorAttributes = errorAttributes;
    }

    /**
     * Display a custom and user-friendly error page rather than the default one from Tomcat.
     * @param webRequest
     * @param model
     * @param request
     * @param response
     * @return
     * @throws JsonProcessingException
     */
    
    @RequestMapping("/error")
    public String handleError(WebRequest webRequest, Model model, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
    	
    	// Get Error details
    	ErrorAttributeOptions options = ErrorAttributeOptions.of(ErrorAttributeOptions.Include.STACK_TRACE);
        Map<String, Object> errorAttributes = this.errorAttributes.getErrorAttributes(webRequest, options);
        model.addAttribute("error", errorAttributes);
        
        // Get the original request
        String path = (String) request.getAttribute(RequestDispatcher.ERROR_REQUEST_URI);
        model.addAttribute("path", path);
        
        /**
         * Convention in this application:
         * The URL of all APIs are start with /api
         * All APIs are in JSON format
         */
        
        // API pages
        if(path.startsWith("/api")) {
        	response.setContentType("application/json");
        	return "_errors/error_json";
        }
        
        // Normal pages
        else {
        	response.setContentType("text/html");
            return "_errors/error_page"; 
        }
        
    }
}
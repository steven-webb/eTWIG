/**
 	* eTWIG - The event management software for Griffin Hall.
 	* @copyright: Copyright (c) 2024 Steven Webb (Social Media Representative)
 	* @license: MIT
 	* @author: Steven Webb [xiaoancloud@outlook.com]
 	* @website: https://etwig.grinecraft.net
 	* @function: The general configuration for eTWIG platform.
 	*/

package net.grinecraft.etwig.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import net.grinecraft.etwig.EtwigInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Autowired
    private EtwigInterceptor userInterceptor;
    
	/**
	 * Register the Interceptor
	 * @param registry
	 */
	
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(userInterceptor);
    }

}

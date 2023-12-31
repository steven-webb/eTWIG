<#-- 
	eTWIG - The event management software for Griffin Hall.
	copyright: Copyright (c) 2024 Steven Webb (Social Media Representative)
	license: MIT
	author: Steven Webb [xiaoancloud@outlook.com]
	website: https://etwig.grinecraft.net
	function: The template for add/edit events, basic information part.
	This part contains the form of basic information like name, location, recurrent and description.
   -->
						
						<#-- Basic Information -->
						<div class="card card-primary card-outline">
							<div class="card-header">
								<h3 class="card-title">
									<i class="fa-solid fa-circle-info"></i>&nbsp;Basic Information
								</h3>
							</div>
							
							<div class="card-body">
								
								<#if disabled>
									<#assign calloutTitle = "No edit permission">
									<#include "./event_noPermission_callout.ftl">
								</#if>
								
								<#-- Event ID -->
								<#if isEdit>
									<div class="form-group row">
										<label for="eventId" class="col-sm-2 col-form-label">
											Id&nbsp;<span class="required-symbol">*</span>
										</label>
										<div class="col-sm-10">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text">
														<i class="fa-solid fa-hashtag"></i>
													</span>
												</div>
												<input type="number" class="form-control" placeholder="Event ID" id="eventId" value="${eventId}" disabled>
											</div>
										</div>
									</div>
								</#if>
								
								<#-- Name -->
								<div class="form-group row">
									<label for="eventName" class="col-sm-2 col-form-label">
										Name&nbsp;<span class="required-symbol">*</span>
									</label>
									<div class="col-sm-10">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text">
													<i class="fa-solid fa-lightbulb"></i>
												</span>
											</div>
											<input type="text" class="form-control" placeholder="Event Name" id="eventName" maxlength="31" value="<#if isEdit>${eventDetails.details.name}</#if>" ${disabledStr}>
										</div>
									</div>
								</div>
								
								<#-- Location -->
								<div class="form-group row">
									<label for="eventLocation" class="col-sm-2 col-form-label">Location</label>
									<div class="col-sm-10">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text">
													<i class="fa-solid fa-location-dot"></i>
												</span>
											</div>
											<input type="text" class="form-control" placeholder="Event Location" id="eventLocation" maxlength="63" value="<#if isEdit>${eventDetails.details.location}</#if>" ${disabledStr}>
											
										</div>
									</div>
								</div>

								<#-- Recurrent -->
								<#-- TODO Implement Recurrent function -->
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
												<input type="radio" id="recurring-event" name="event-recurrent" disabled>
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
												<div class="callout callout-info">
													<h5 class="bold-text mb-3">Be Careful!</h5>
													Once you set the recurrent option, it cannot be changed unless you delete the event completely, then add a new event.
												</div>
											</#if>
										</#if>
									</div>
								</div>
								
								<#-- Description -->
								<div class="form-group">
									<label for="eventDescription">Description</label>
									<div id="eventDescription"><#if isEdit>${eventDetails.details.description}</#if></div>
								</div>
							</div>
						</div>	
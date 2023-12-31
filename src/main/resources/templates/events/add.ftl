<#-- 
	eTWIG - The event management software for Griffin Hall.
	copyright: Copyright (c) 2024 Steven Webb (Social Media Representative)
	license: MIT
	author: Steven Webb [xiaoancloud@outlook.com]
	website: https://etwig.grinecraft.net
	function: The add event page.
   -->
   
<#assign navbar = "ADD_EVENT">

<#-- Add mode. -->
<#assign isEdit = false>
<#assign isEditStr = "false">

<#-- Convert the "Embedded" boolean to String -->
<#assign isEmbeddedStr = embedded ?string('true', 'false')>

<#-- In add mode, inputs are also enabled, -->
<#assign disabled = false>
<#assign disabledStr ="">

<#-- In add mode, mode is always called "Add". -->
<#assign modeStr = "Add">

<#-- In add mode, the link of this page is always "/event/add". -->
<#assign link = "add">

<#-- In add mode, the default time unit is always h (hour) and the default duration is always 1.  -->
<#assign timeUnit = "h">
<#assign duration = 1>

<#-- In add mode, the duration input will never been hidden.  -->
<#assign durationHidden = false>

<!DOCTYPE html>
<html>
<head>
	<#include "../_includes/header_head.ftl">
	<title>Add Event - ${app.appName}</title>
</head>

<body class="sidebar-mini layout-fixed">
	<#include "../_includes/header_body_start.ftl">
	
	<#if !embedded>
		<#include "../_includes/sidebar.ftl">
	</#if>
	
	<#-- Content Wrapper -->
  	<div class="<#if !embedded>content-</#if>wrapper">
  	
		<#-- Page header -->
		<#if !embedded>
    		<#include "../_includes/event_addEdit_header.ftl">
    	</#if>
    	
    	<#-- Main area -->
    	<section class="content">
			<form class="container-fluid" id="addEventForm" action="/events/add" method="post">
			
				<div class="row">
					<div class="col-md-6">
					
						<#-- Basic Information -->		
						<#include "../_includes/event_addEdit_basicInfo.ftl">			
									
						<#-- Organizer -->		
						<#include "../_includes/event_addEdit_organizer.ftl">
					</div>
					
					<div class="col-md-6">
					
						<#-- Timing -->		
						<#include "../_includes/event_addEdit_timing.ftl">

						<#-- Properties -->
						<#include "../_includes/event_addEdit_properties.ftl">
						
						<#-- Footer -->
						<#include "../_includes/event_addEdit_footer.ftl">
					</div>
				</div>
				
			</form>
		</section>

	</div>
	

	
	<#-- Footer -->
	<#if embedded == false>
		<#include "../_includes/footer.ftl">
	</#if>
	<#include "../_includes/header_body_end.ftl">
	
	<#-- CSS and JS for summernote editor.-->
	<link rel="stylesheet" href="/static/css/summernote-bs4.min.css">
	<script src="/static/js/summernote-bs4.min.js"></script>
	
	<#-- Custom JS for adding events-->
	<script src="/static/js/etwig-events.js"></script>
	
	<#-- Post Scripts -->
	<#include "../_includes/event_addEdit_postScripts.ftl">
</body>
</html>
<!DOCTYPE html>
<html>
<head>
	<#include "../_includes/header.ftl">
	
	<#-- CSS and JS for summernote editor.-->
	<link rel="stylesheet" href="/static/css/summernote-bs4.min.css">
	<script src="/static/js/summernote-bs4.min.js"></script>
	
	<#-- Custom JS for adding events-->
	<script src="/static/js/etwig-events.js"></script>

	<title>Add Event - eTWIG Administration Portal</title>
</head>

<body class="sidebar-mini layout-fixed">
	<#if embedded == false>
		<#include "../_includes/sidebar.ftl">
	</#if>
	
	
	<#-- Content Wrapper -->
  	<div class="<#if embedded == false>content-</#if>wrapper">
  	
		<#-- Page header -->
		<#if embedded == false>
    	<#include "../_includes/event_addEdit_header.ftl">
    	</#if>
    	
    	<#-- Main area -->
    	<section class="content">
			<form class="container-fluid" id="addEventForm" action="/events/add" method="post">
			
				<div class="row">
					<div class="col-md-6">
						<#-- Basic Information -->		
						<#include "../_includes/event_addEdit_basicInfo.ftl">
					</div>
					
					<div class="col-md-6">
					
						<#-- Timing -->		
						<#include "../_includes/event_addEdit_timing.ftl">
						
						<#-- Organizer -->		
						<#include "../_includes/event_addEdit_organizer.ftl">
						
						<#-- Properties -->
						<#include "../_includes/event_addEdit_properties.ftl">
						
					</div>
				</div>
				
				<#-- Footer -->
				<#include "../_includes/event_addEdit_footer.ftl">
				
			</form>
		</section>

	</div>
	
	<#-- Post Scripts -->
	<#include "../_includes/event_addEdit_postScripts.ftl">
</body>
</html>
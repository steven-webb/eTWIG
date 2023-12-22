<#-- 
	Top navbar and sidebar component. 
	This is a part of the eTWIG platform.
-->

	<#-- Navbar -->
  	<nav class="main-header navbar navbar-expand navbar-white navbar-light">
  	
    <#-- Left navbar (Only a button to show/hode the aside) -->
    	<ul class="navbar-nav">
      		<li class="nav-item">
        		<a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      		</li>
    	</ul>

    	<#-- Right navbar links -->
    	<ul class="navbar-nav ml-auto">

      		<#-- Notifications Dropdown Menu -->
      		<li class="nav-item dropdown">
       			<a class="nav-link" data-toggle="dropdown" href="#">
          			<i class="far fa-bell"></i>
          			<span class="badge badge-warning navbar-badge">15</span>
        		</a>
        		
        		<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          			<span class="dropdown-header">15 Notifications</span>
          			<div class="dropdown-divider"></div>
          			<a href="#" class="dropdown-item">
            			<i class="fas fa-envelope mr-2"></i> 4 new messages
            			<span class="float-right text-muted text-sm">3 mins</span>
          			</a>
          				
          			<a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        		</div>
      		</li>
      		
      		<#-- Switch to fullscreen -->
      		<li class="nav-item">
        		<a class="nav-link" data-widget="fullscreen" href="#" role="button">
          			<i class="fas fa-expand-arrows-alt"></i>
        		</a>
      		</li>
    	</ul>
    </nav>
    
    <#-- Main Sidebar -->
  	<aside class="main-sidebar sidebar-dark-primary elevation-4">
  	
    	<#-- eTWIG Logo -->
    	<a href="/" class="brand-link">
      		<img src="/static/images/eTWIG_white.png" alt="eTWIG Logo" class="brand-image">
      		<span class="brand-text font-weight-light">
      			<#if username?has_content>Admin<#else>Public</#if>
      		</span>
    	</a>

    	<#-- Sidebar -->
    	<div class="sidebar">
    	
      		<#-- User panel -->
      		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
        		<div class="image">
        			<img src="/static/images/default_avatar.svg" class="elevation-2" alt="User Avatar">
        			<!--<i class="fa-solid fa-user fa-xl img-circle elevation-2" style="color: #ffffff;"></i>-->
        		</div>
        		<div class="info">
          			<a href="#" class="d-block">
          				<#if username?has_content>${username}<#else>Guest</#if>
          			</a>
        		</div>
      		</div>

      		<#-- Menu -->
      		<nav class="mt-2">
        		<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        	
        			<#-- Dashboard -->
        			<li class="nav-item">
            			<a href="/" class="nav-link <#if navbar=="DASHBOARD">active</#if>">
              				<i class="nav-icon fas fa-gauge-high"></i>
              				<p>Dashboard</p>
            			</a>
          			</li>
          		
          			<#-- TWIG -->
        			<li class="nav-item">
            			<a href="#" class="nav-link <#if navbar=="TWIG">active</#if>">
              				<i class="nav-icon fas fa-lightbulb"></i>
              				<p>TWIG</p>
            			</a>
          			</li>
          
					<#-- Event Management -->
          			<li class="nav-header">Event Management</li>
          			
          			<#-- Event: Calendar -->
        			<li class="nav-item">
            			<a href="/events/calendar" class="nav-link <#if navbar=="CALENDAR">active</#if>">
              				<i class="nav-icon fas fa-calendar"></i>
              				<p>Calendar</p>
            			</a>
          			</li>	
          			
          			<#-- Event: List -->
        			<li class="nav-item">
            			<a href="#" class="nav-link">
              				<i class="nav-icon fas fa-list"></i>
              				<p>List</p>
            			</a>
          			</li>		
          			
          			<#-- Banner Management -->
          			<li class="nav-header">Banner Management</li>
        		</ul>
      		</nav>
    	</div>
  </aside>
        
        <#-- Nav -->
        <nav class="main-header navbar navbar-expand-md navbar-light navbar-white no-padding">
            <div class="container-fluid">
            
            	<#-- Logo -->
				<a href="/" class="navbar-brand">
					<img src="/static/images/eTWIG.png" alt="eTWIG Logo" class="brand-image">
					<span class="brand-text font-weight-light">&nbsp;</span>
				</a>
				<#-- /Logo -->
				
				<button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				
				<#-- Navbar left -->
				<div class="collapse navbar-collapse no-padding" id="navbarCollapse">
					<ul class="navbar-nav">
					
						<#-- Dashboard -->
						<li class="nav-item <#if navbar=="DASHBOARD">active</#if>">
							<a href="/" class="nav-link navbar-border">
								<i class="fa-solid fa-gauge-high"></i>&nbsp;Dashboard
							</a>
						</li>
						<#-- /Dashboard -->
						
						<#-- TWIG -->
						<li class="nav-item">
							<a href="/twig" class="nav-link navbar-border">
								<i class="fa-solid fa-tree"></i>&nbsp;TWIG
							</a>
						</li>
						<#-- /TWIG -->
						
						<#-- Events -->
						<li class="nav-item <#if navbar=="CALENDAR">active</#if>">
							<a href="/events/calendar" class="nav-link navbar-border">
								<i class="fa-solid fa-calendar-check"></i>&nbsp;Events
							</a>
						</li>
						<#-- /Events -->
						
						<#-- Graphics -->
          				<#if access.graphicsAccess || true>
							<li class="nav-item dropdown">
							
								<#-- Dropdown btn -->
								<a id="graphicsSubMenu" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link navbar-border">
									<i class="fa-solid fa-icons"></i>&nbsp;Graphics&nbsp;<i class="fa-solid fa-caret-down"></i>
								</a>
								<#-- /Dropdown btn -->
								
								<ul aria-labelledby="graphicsSubMenu" class="dropdown-menu border-0 shadow">
								
									<#-- Graphics Approval -->
									<li>
										<a href="#" class="dropdown-item <#if navbar=="GRAPHICS_APPROVAL">active</#if>">
											<i class="fa-solid fa-circle-check"></i>&nbsp;Approval
										</a>
									</li>
									<#-- /Graphics Approval -->
									
									<#-- TWIG Template -->
									<li>
										<a href="#" class="dropdown-item <#if navbar=="TWIG_TEMPLATE">active</#if>">
											<i class="fa-solid fa-lines-leaning"></i>&nbsp;TWIG Template
										</a>
									</li>
									<#-- TWIG Template -->
								
								</ul>
							</li>
						</#if>
					    <#-- /Graphics -->
					
					    <#-- Admin -->
          				<#if access.adminAccess || true>
							<li class="nav-item dropdown">
							
								<#-- Dropdown btn -->
								<a id="adminSubMenu" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link navbar-border">
									<i class="fa-solid fa-shield-halved"></i>&nbsp;Admin&nbsp;<i class="fa-solid fa-caret-down"></i>
								</a>
								<#-- /Dropdown btn -->
								
								<ul aria-labelledby="adminSubMenu" class="dropdown-menu border-0 shadow">
								
								</ul>
							</li>
						</#if>
					    <#-- /Admin -->

				    </ul>
                </div>
			</div>
			<#-- /Navbar left-->
			
            <#-- Navbar right-->
			<ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">

                <#-- Notifications -->
                <li class="nav-item dropdown">
                	
                	<#-- Bell icon -->
                	<a class="nav-link navbar-border" data-toggle="dropdown" href="#">
                   		<i class="far fa-bell"></i>
                    	<span class="badge badge-warning navbar-badge">15</span>
                	</a>
                	<#-- /Bell icon -->
                	
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-header">15 Notifications</span>
						<div class="dropdown-divider"></div>
						
						<#-- Notification item -->
						<a href="#" class="dropdown-item">
							<i class="fas fa-envelope mr-2"></i> 4 new messages
							<span class="float-right text-muted text-sm">3 mins</span>
						</a>
						<#-- /Notification item -->

                    </div>
				</li>
                <#-- /Notifications -->

                <#-- Account -->
                <li class="nav-item dropdown">
                	
                	<#-- User icon -->
                	<a class="nav-link navbar-border" data-toggle="dropdown" href="#">
                   		<i class="fa-solid fa-user"></i>
                	</a>
                	<#-- /User icon -->
                	
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<div class="dropdown-divider"></div>
						
						<#-- Logout -->						
						<a href="#" class="dropdown-item">
							<i class="fa-solid fa-right-from-bracket"></i>&nbsp;Logout
						</a>	
						<#-- /Logout -->

                    </div>
				</li>
                <#-- /Account -->

			</ul>
			<#-- /Navbar right-->

        </nav>
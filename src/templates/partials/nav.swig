<nav class="navbar navbar-primary navbar-fixed-top" id="menu-main">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#main-nav-collapse">
				<span class="sr-only">Toggle navigation</span>
				<i class="fa fa-bars"></i>
			</button>
			<a href="/donate" class="collapsed donate-link-collapsed link-collapsed">
				<span class="sr-only">Donate</span>
				<i class="icon-donate"></i>
			</a>
			{# <a href="/fundraising" class="collapsed fundraising-link-collapsed link-collapsed">
				<span class="sr-only">Fundraising</span>
				<i class="icon-donate"></i>
			</a> #}
			<a href="{{ relative('/')|default('/') }}" class="navbar-brand">
				<img class='navbar-brand-logo' src="/images/logos/gwwc-logo-transparent-nav-2021.png">
				<img class='navbar-brand-logo-xxs' src="/images/logos/gwwc-logo-transparent-nav-2021-small.png">
			</a>
		</div>
		<div class="collapse navbar-collapse" id="main-nav-collapse">
			<ul class="nav navbar-nav navbar-right">
				{% set menu = menu || 'main' %}
				{% for parent in menus[menu] %}
					{% if parent._menu %}
					<li class="nav dropdown {{ parent._menu.fields.slug }}">
						 <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							{{ parent._menu.fields.title }}
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu {{ parent._menu.fields.slug + '-dropdown'}}">
							{% for child in parent._children %}
								{% if child._page %}
									<li class="{{ {true:'active',false:''}[path === child._page.path] }} {{child._page.slug }}">
										{% set childTitle = child._page.shortTitle || child._page.title %}
										<a href="{{ relative(child._page.path) }}">{{ childTitle }}</a>
									</li>
								{% elif child._link %}
									<li class="{{ {true:'active',false:''}[path === child._page.path] }} {{ {true:child._link.linkURL.substr(0),false:'external-link'}[child._link.linkURL.charAt(0)==='/'] }}">
										{% set childTitle = child._link.shortTitle || child._link.title %}
										<a href="{{ child._link.linkURL }}">{{ childTitle }}</a>
									</li>
								{% endif %}
							{% endfor %}
						</ul>
					</li>
					{% elif parent._page %}
					<li class="nav {{parent._page.slug}}">
						{% set pageTitle = parent._page.shortTitle || parent._page.title %}
						<a href="{{ relative(parent._page.path) }}">{{pageTitle}}</a>
					</li>
					{% elif parent._link %}
					<li class="nav {{ {true:parent._link.linkURL.substr(1),false:'external-link'}[parent._link.linkURL.charAt(0)==='/'] }} {{ parent._link.className }}">
						{% set linkTitle = parent._link.shortTitle || parent._link.title %}
						<a href="{{ parent._link.linkURL }}">
							{{linkTitle}}
						</a>
					</li>
					{% endif %}
				{% endfor %}
			</ul>
		</div>
	</div>
</nav>

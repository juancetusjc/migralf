<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key=" lang.dir" />
" lang="${w3c_language_id}">

<head>
<title>${the_title} - ${company_name}</title>

<meta content="initial-scale=1.0, width=device-width" name="viewport" />

<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

	<@liferay_ui["quick-access"] contentId="#main-content" />

	<@liferay_util["include"] page=body_top_include />

	<@liferay.control_menu />

	<div class="pt-0" id="wrapper">
		<header id="banner" role="banner">
			<div id="header-top">
				<div class="container hidden-xs">
					<div class="pull-left header-contact" id="header-top-container">

					</div>

					<div class="pull-right" id="header-top-container">
						<div class="pull-right">
							<#if !is_signed_in> <a
								data-redirect="${is_login_redirect_required?string}"
								href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
							</#if>
						</div>
					</div>
				</div>
			</div>

			<div id="banner-med" class="navbar navbar-classic navbar-top py-3">
				<div class="container user-personal-bar">
					<div class="align-items-center autofit-row">
						<a class="${logo_css_class}" href="${site_default_url}"
							title="<@liferay.language_format arguments="
							${site_name}" key="go-to-x" />"> <img alt="${logo_description}"
							height="${site_logo_height}" src="${site_logo}"
							width="${site_logo_width}" /> </a>

						<div class="autofit-col autofit-col-expand">
							<div class="justify-content-md-end mr-4 navbar-form"
								role="search"></div>
						</div>
						<div class="autofit-col"></div>
					</div>
				</div>
			</div>


			<div
				class="mb-4 navbar navbar-classic navbar-expand-md navbar-light pb-3" id="menubar">
				<div class="container">

					<#if has_navigation && is_setup_complete> <#include "${full_templates_path}/navigation.ftl" />
					</#if>

				</div>
			</div>

		</header>

		<section id="content">
			<h1 class="hide-accessible">${the_title}</h1>

			<nav id="breadcrumbs"><@liferay.breadcrumbs /></nav>

			<#if selectable> <@liferay_util["include"] page=content_include
			/> <#else> ${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)} <@liferay_theme["wrap-portlet"]
			page="portlet.ftl"> <@liferay_util["include"] page=content_include />
			</@> </#if>
		</section>

		<footer id="footer" role="contentinfo">
			<p class="powered-by">
				© ESCALE - Unidad de Estadística Educativa - Ministerio de Educación
				- 2019<br> Correo electrónico - <a
					href="http://www.google.com/recaptcha/mailhide/d?k=01Mue9jrwnlYcXvY8K63Z1bg==&amp;c=y-EcrEo_YwLoIG7lARp2Ao6o98jK3wwQ4GumsBltYiw="
					onclick="window.open('http://www.google.com/recaptcha/mailhide/d?k\07501Mue9jrwnlYcXvY8K63Z1bg\75\75\46c\75y-EcrEo_YwLoIG7lARp2Ao6o98jK3wwQ4GumsBltYiw\075', '', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=500,height=300'); return false;"
					title="Mostrar el correo electrónico completo">esc...@minedu.gob.pe</a>
			</p>
		</footer>
	</div>

	<@liferay_util["include"] page=body_bottom_include />

	<@liferay_util["include"] page=bottom_include />

</body>

</html>
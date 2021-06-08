<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr"%>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib"%>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions"%>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib"%>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib"%>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search"%>

<template:addResources type="css" resources="vendor/algolia.css" />
<template:addResources type="css" resources="search.css" />

<template:addResources type="javascript"
	resources="algolia/vendor/selectize.js" />
<template:addResources type="javascript"
	resources="algolia/vendor/algoliasearch-lite.umd.js" />
<template:addResources type="javascript"
	resources="algolia/vendor/instantsearch.js" />
<template:addResources defer="true" type="javascript"
	resources="algolia/search.js" />
<template:addResources type="javascript"
	resources="algolia/facets/refinement-list.js" />
<template:addResources type="javascript"
	resources="algolia/facets/range-slider.js" />
<template:addResources type="javascript"
	resources="algolia/facets/range-input.js" />

<div class="row">
	<div class="col-md-12">
		<template:include view="hidden.filter" />
	</div>
</div>

<template:include view="hidden.hit" />

<template:include view="hidden.view" />

<script>
	$(document).ready(function() {
		$(".facet-accordion-head").click(function() {
			$(this).toggleClass("active");
			$(this).siblings(".facet-accordion-body").slideToggle();
		})
	});	
</script>

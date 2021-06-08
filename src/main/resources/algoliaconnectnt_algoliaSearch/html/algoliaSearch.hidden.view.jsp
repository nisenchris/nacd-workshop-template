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

<c:set var="disableSearch"
	value="${currentNode.properties.disableSearch.boolean}" />
<c:set var="hitsPerPage"
	value="${currentNode.properties.hitsPerPage.long}" />
<c:set var="placeholderText"
	value="${currentNode.properties.placeholderText.string}" />
<c:set var="autoFocus"
	value="${(empty currentNode.properties.autoFocus.boolean) ? false : currentNode.properties.autoFocus.boolean}" />
<c:set var="showStats"
	value="${(empty currentNode.properties.showStats.boolean) ? false : currentNode.properties.showStats.boolean}" />
<c:set var="showLoading"
	value="${(empty currentNode.properties.showLoading.boolean) ? false : currentNode.properties.showLoading.boolean}" />
<c:set var="enableAutocomplete"
	value="${(empty currentNode.properties.enableAutocomplete.boolean) ? false : currentNode.properties.enableAutocomplete.boolean}" />
<c:set var="enableFileType"
	value="${(empty currentNode.properties.enableFileType.boolean) ? false : currentNode.properties.enableFileType.boolean}" />
<c:set var="searchAsYouType"
	value="${(empty currentNode.properties.searchAsYouType.boolean) ? true : currentNode.properties.searchAsYouType.boolean}" />
<c:set var="enablePagination"
	value="${(empty currentNode.properties.enableAutocomplete.boolean) ? false : currentNode.properties.enableAutocomplete.boolean}" />
<c:set var="clearRefinements"
	value="${(empty currentNode.properties.clearRefinements.boolean) ? false : currentNode.properties.clearRefinements.boolean}" />
<c:set var="enableVoiceSearch"
	value="${(empty currentNode.properties.enableVoiceSearch.boolean) ? false : currentNode.properties.enableVoiceSearch.boolean}" />

<%-- 
containerId: "search-widget-${currentNode.identifier}",
facetContainer: '.${currentNode.identifier}_facet',
filterContainer: '.${currentNode.identifier}_filter'
--%>

<c:if test="${enablePagination}">
	<template:addResources type="javascript" resources="algolia/pagination.js" />
</c:if>

<c:if test="${enableHitsPerPage}">
	<template:addResources type="javascript" resources="algolia/hitsPerPage.js" />
</c:if>

<c:if test="${clearRefinements}">
	<template:addResources type="javascript" resources="algolia/clearRefinements.js" />
</c:if>

<c:if test="${enableVoiceSearch}">
	<template:addResources type="javascript" resources="algolia/voicesearch.js" />
</c:if>

<c:if test="${enableAutocomplete}">
	<c:set var="searchType" value="autoCompleteSearch" />
	<template:addResources type="css" resources="vendor/selectize.css" />
</c:if>

<style>
  .jahia_searchbox-container {
	margin: 0;
    width: 100%;
    height: 60px;
    margin-top: 15px;
  }
  .jahia_searchbox {
    height: 25px;
    width: 100% !important;
    margin: 0 !important;
  }
  .facets-panel {
    margin: 0 !important;
    background-color: transparent;
  }
  .facet-accordion {
    margin-bottom: 10px !important;
    margin: 0px;  
    background-color: white;
  }
  .facet-accordion-head h5 {
    font-size: 1.5rem !important;
  }
  .ais-RefinementList .ais-RefinementList-label .ais-RefinementList-labelText {
    font-size: 1.3rem !important;
  }
  .headerTitle {
    font-size: 1.7rem !important;
    font-weight: bold;
  }
  .footerTitle {
    margin-top: 15px !important;
    font-size: 1.5rem !important;
  }
  .poweredBy {
    height: 50px !important;
    width: 90px !important;
  }
  .selectize-dropdown, .selectize-input, .selectize-input input {
    font-size: 25px !important;
   }
   #searchbox .selectize-input.items.not-full {
    height: 50px !important;
  }  
.selectize-control.single .selectize-input:before {
    font: normal normal normal 1.8rem/1 FontAwesome !important;
}  
</style>

  
  <div class="search-wrapper" data-search-type="${searchType}"
	data-pagination="${enablePagination}"
	data-clearRefinements="${clearRefinements}"
	data-app="${renderContext.site.properties.algoliaAppId}"
	data-index="${renderContext.site.properties.algoliaIndexName}"
     data-key="${renderContext.site.properties.algoliaApiKey}" style="margin-left:10%;margin-right:10%;">

	<%-- Search box starts --%>
	<div class="jahia_searchbox-container" data-autoFocus="${autoFocus}"
		data-placeholder="${placeholderText}"
		data-showLoading="${showLoading}"
		data-searchAsYouType="${searchAsYouType}">
		<div class="jahia_searchbox" id="searchbox"></div>
		<div id="voicesearch"></div>
	</div>
	<%-- Search box ends --%>

    <div class="ais-InstantSearch" style="width:100%">
      <div class="left-panel" style="margin:0;padding:0">
        <div class="headerTitle">Refine by:</div>
			<%-- Facets Panels starts --%>
			<div class="facets-panel">
				<div id="hits-per-page"></div>
				<div id="clear-refinements"></div>
				<%-- Facets starts --%>
				<template:include view="hidden.facet" />
				<%-- Facets ends --%>
				<div id="voicesearch"></div>
			</div>
        	<div class="footerTitle">Powered by:<img class="poweredBy" src="https://seekvectorlogo.com/wp-content/uploads/2019/07/algolia-vector-logo.png" height="50px" width="90px"></div>
			<%-- Facets Panels ends--%>
		</div>
      <div class="right-panel" style="padding-right:0">
			<div id="autocomplete"></div>
			<div id="hits"></div>
			<div id="infinite-hits"></div>
			<div id="pagination"></div>
		</div>
	</div>
</div>
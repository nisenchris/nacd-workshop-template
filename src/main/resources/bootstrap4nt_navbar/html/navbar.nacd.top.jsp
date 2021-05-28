<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>

<template:addResources type="css" resources="bootstrap.min.css"/>
<template:addResources type="javascript" resources="jquery.min.js"/>
<template:addResources type="javascript" resources="popper.min.js"/>
<template:addResources type="javascript" resources="bootstrap.min.js"/>

<c:set var="siteNode" value="${renderContext.site}"/>
<c:choose>
    <c:when test="${not empty siteNode && !(jcr:isNodeType(siteNode, 'bootstrap4mix:siteBrand'))}">
        <c:set var="brandImage" value="${siteNode.properties.brandImage.node}"/>
        <c:set var="brandImageMobile" value="${siteNode.properties.brandImageMobile.node}"/>
        <c:set var="brandText" value="${siteNode.properties.brandText.string}"/>
    </c:when>
    <c:when test="${not empty currentNode && !(jcr:isNodeType(currentNode, 'bootstrap4mix:brand'))}">
        <c:set var="brandImage" value="${currentNode.properties.brandImage.node}"/>
        <c:set var="brandImageMobile" value="${currentNode.properties.brandImageMobile.node}"/>
        <c:set var="brandText" value="${currentNode.properties.brandText.string}"/>
    </c:when>
</c:choose>

<c:if test="${jcr:isNodeType(currentNode, 'bootstrap4mix:customButtonNavbar')}">
    <c:set var="buttonClass" value="${currentNode.properties.buttonClass.string}"/>
</c:if>

<c:if test="${empty buttonClass}">
    <c:set var="buttonClass" value="navbar-toggler navbar-toggler-right"/>
</c:if>

<c:if test="${jcr:isNodeType(currentNode, 'bootstrap4mix:advancedNavbar')}">
    <c:set var="navClass" value="${currentNode.properties.navClass.string}"/>
    <c:set var="divClass" value="${currentNode.properties.divClass.string}"/>
    <c:set var="addContainerWithinTheNavbar" value="${currentNode.properties.addContainerWithinTheNavbar.boolean}"/>
    <c:set var="addLoginButton" value="${currentNode.properties.addLoginButton.boolean}"/>
    <c:set var="addLanguageButton" value="${currentNode.properties.addLanguageButton.boolean}"/>
</c:if>
<c:if test="${empty navClass}">
    <c:set var="navClass" value="navbar navbar-expand-lg navbar-light bg-light"/>
</c:if>
<%-- try to get the expand size --%>
<c:set var="expand" value="lg"/>
<c:forEach items="${fn:split(navClass, ' ')}" var="currentClass">
    <c:if test="${fn:startsWith(currentClass, 'navbar-expand-')}">
        <c:set var="expand" value="${fn:replace(currentClass, 'navbar-expand-', '')}"/>
    </c:if>
</c:forEach>
<c:if test="${empty divClass}">
    <c:set var="divClass" value="collapse navbar-collapse"/>
</c:if>
<c:if test="${empty addContainerWithinTheNavbar}">
    <c:set var="addContainerWithinTheNavbar" value="false"/>
</c:if>
<c:if test="${empty addLoginButton}">
    <c:set var="addLoginButton" value="false"/>
</c:if>
<c:if test="${empty addLanguageButton}">
    <c:set var="addLanguageButton" value="true"/>
</c:if>

<c:set var="root" value="${currentNode.properties.root.string}"/>

<c:set var="curentPageNode" value="${renderContext.mainResource.node}"/>
<c:if test="${! jcr:isNodeType(curentPageNode,'jmix:navMenuItem')}">
    <c:set var="curentPageNode" value="${jcr:getParentOfType(curentPageNode, 'jmix:navMenuItem')}"/>
</c:if>

<c:choose>
    <c:when test="${root eq 'currentPage'}">
        <c:set var="rootNode" value="${curentPageNode}"/>
    </c:when>
    <c:when test="${root eq 'parentPage'}">
        <c:set var="rootNode" value="${curentPageNode.parent}"/>
    </c:when>
    <c:otherwise>
        <c:set var="rootNode" value="${renderContext.site.home}"/>
    </c:otherwise>
</c:choose>
<nav  data-v-7dd7870e data-v-36407026 class="sub-nav">
    <c:if test="${addContainerWithinTheNavbar}">

        </c:if>
        <c:choose>
            <c:when test="${jcr:isNodeType(rootNode, 'jnt:virtualsite')}">
                <c:url var="rootNodeUrl" value="${renderContext.site.home.url}"/>
            </c:when>
            <c:otherwise>
                <c:url var="rootNodeUrl" value="${rootNode.url}"/>
            </c:otherwise>
        </c:choose>


            <template:include view="nacd.top.base"/>
            <c:if test="${addLoginButton}">
                <template:include view="hidden.login"/>
            </c:if>
            <c:if test="${addLanguageButton}">
                <template:include view="hidden.languages"/>
            </c:if>
        <c:if test="${addContainerWithinTheNavbar}">
    </c:if>
</nav>
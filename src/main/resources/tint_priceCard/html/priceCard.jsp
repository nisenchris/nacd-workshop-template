<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>



<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="info" value="${currentNode.properties.info.string}"/>
<c:set var="price" value="${currentNode.properties['price'].string}"/>

<fmt:formatNumber value="${price}" currencySymbol="$" type="currency" var="price" />

<template:include view="hidden.generateLink"/>

<div data-v-c4126480="" data-v-dc5bb76a="" class="price-card" data-v-5ecfc389="">
    <div data-v-c4126480="" class="price-card__name"><span style="font-size:16px;">${title}</span></div>
    <div data-v-c4126480="" class="price-card__price">${price}</div>
    <div data-v-c4126480="" class="price-card__info">
        <p data-v-c4126480="" class="price-card__detail">${info}</p>
    </div> <a data-v-c4126480="" href="${moduleMap.linkUrl}"
        target="" class="price-card__button">Register Now</a>
</div>
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
<c:set var="body" value="${currentNode.properties.body.string}"/>
<c:set var="imageNode" value="${currentNode.properties.image.node}"/>

<template:addCacheDependency node="${imageNode}"/>
<c:url var="imageURL" value="${imageNode.url}"/>

<template:include view="hidden.generateLink"/>

<div class="column-100" data-v-784b286e="" data-v-fb4b1cc4="">
    <a class="box" data-v-784b286e="" data-v-fb4b1cc4="" href="${moduleMap.linkUrl}">
        <div class="row" data-v-784b286e="">
            <div class="column-50-md featured" data-v-784b286e="">
                <img alt="${title}" data-v-784b286e="" src="${imageNode.url}" />
            </div>

            <div class="column-50-md" data-v-784b286e="">
                <h3 data-v-784b286e="">${title}</h3>

                <div class="no-link" data-v-784b286e="">
                    <p>${body}</p>
                </div>
            </div>
        </div>
    </a>
</div>
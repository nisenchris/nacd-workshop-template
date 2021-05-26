<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>


<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="lead" value="${currentNode.properties.lead.string}"/>
<c:set var="imageNode" value="${currentNode.properties.image.node}"/>

<template:addCacheDependency node="${imageNode}"/>
<c:url var="imageURL" value="${imageNode.url}"/>



<!-- <div class="media d-block media-custom text-center">
    <c:choose>
        <c:when test="${not empty moduleMap.linkUrl}">
            <a href="${moduleMap.linkUrl}" target="${moduleMap.linkTarget}">
        </c:when>
        <c:otherwise>
            <div class="a-like">
        </c:otherwise>
    </c:choose>
            <img src="${imageURL}" alt="people" class="img-fluid">
    <c:choose>
        <c:when test="${not empty moduleMap.linkUrl}">
            </a>
        </c:when>
        <c:otherwise>
            </div>
        </c:otherwise>
    </c:choose>

    ${body}
</div> -->

<div class="hero column bw" data-v-bb71eb2c=""
    style="background-image: linear-gradient(to right, rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0)), url('${imageURL}');">
    <div class="hero-content column-50" data-v-bb71eb2c="">
        <p class="display-1 hero-title" data-v-bb71eb2c="">${title}</p>
        <p data-v-bb71eb2c="" class="hero-lead">${lead}</p>
    </div>
</div>
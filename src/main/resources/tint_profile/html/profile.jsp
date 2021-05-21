<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>


<c:set var="fullName" value="${currentNode.properties.fullName.string}"/>
<c:set var="title" value="${currentNode.properties.title.string}"/>
<c:set var="bio" value="${currentNode.properties.bio.string}"/>
<c:set var="imageNode" value="${currentNode.properties.image.node}"/>
<c:set var="emptyImage" value="/files/{workspace}/modules/industrial/2.1.4-SNAPSHOT/files/images/template/emptyProfile.png"/>

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
<a data-v-ad7469ae="" data-v-dc5bb76a="" href="#" class="profile-card column-25" data-v-5ecfc389="">
    <c:choose>
        <c:when test="${not empty imageNode}">
            <img data-v-ad7469ae="" src="${imageURL}" alt="${fullName}">
        </c:when>
        <c:otherwise>
            <img data-v-ad7469ae="" src="${emptyImage}" alt="${fullName}">
        </c:otherwise>
    </c:choose>
    <p data-v-ad7469ae="" class="h4 stack name">${fullName}</p>
    <p data-v-ad7469ae="" class="stack title">${title}</p>
</a>
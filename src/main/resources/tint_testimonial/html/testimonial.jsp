<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>


<c:set var="fullName" value="${currentNode.properties.fullName.string}"/>
<c:set var="title" value="${currentNode.properties.title.string}"/>
<c:set var="quote" value="${currentNode.properties.quote.string}"/>
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
<div data-v-36407026="" class="aside column-100">
    <div data-v-082355da="" data-v-dc5bb76a="" class="container" data-v-36407026="">
        <div data-v-082355da="" class="quote row bw" style="background-color: rgb(64, 64, 64);">
            <div data-v-082355da="" class="quote_img column-25-md"
                style="background-image: url(${imageURL});"></div>
            <div data-v-082355da="" class="flex center-v center-h column-75-md">
                <div data-v-082355da="" class="quote_content">
                    <div data-v-082355da="" class="quote_text display-3">${quote}</div>
                    <p data-v-082355da="" class="quote_author">${fullName}</p>
                    <p data-v-082355da="" class="quote_author_title">${title}</p>
                </div>
            </div>
        </div>
    </div>
    <!-- <div data-v-39c58b3e="" data-v-36407026="" class="footer-ads">
        <div data-v-39c58b3e="" class="row contain"><a data-v-39c58b3e="" href="https://certification.nacdonline.org/"
                class="column-50-md bw footer-ad"><img data-v-39c58b3e=""
                    src="/files/Certification-Footer-628x150.png"></a> <a data-v-39c58b3e=""
                href="https://summit.nacdonline.org" class="column-50-md bw footer-ad"><img data-v-39c58b3e=""
                    src="/files/Summit_Footer-Web-Banner_628x150.jpg"></a></div>
    </div> -->
</div>
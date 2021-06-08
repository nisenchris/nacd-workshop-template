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

<style>
  .hit-content {
     padding: 1.75rem;
  }
  .hit-name h4 {
    font-size: 1.8rem;   
  }
  .hit-content p {
    font-size: 1.4rem;
  }
.hit-card .cta {
    padding-left: 10px;

}
</style>


<script type="text/template" id="search-widget_hits_template">
<div class="hit-card">
		<div class="hit-content">
		<div class="hit-name"><h4>{{jcr_title}}</h4></div>
			<p>{{companyName}}{{eventType}}</p>
            <p style="display:table-cell;color:darkblue">{{nodeType}}</p>      	            
			<p>{{#helpers.snippet}}{ "attribute": "description" }{{/helpers.snippet}}</p>
			<div class="cta-group">
				<a target="_self" href="{{url}}" title="{{jcr_title}}">
					<button class="cta cta-default">
						<span class="cta-content">
							Read More
						</span>
						<span class="cta-icon-box">
							<i class="fa fa-caret-right"></i>
						</span>
					</button>
				</a>
			</div>
		</div>
	</div>
</script>

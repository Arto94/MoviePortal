<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: XTreme.ws
  Date: 04.03.2018
  Time: 0:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="comments" id="blogComments">
    <c:forEach items="${comments}" var="comment">

        <div class="cmt-item flex-it">

            <img src="/image?fileName=${comment.user.picUrl}" alt="">

            <div class="author-infor">
                <div class="flex-it2">
                    <h6><a href="">${comment.user.name} ${comment.user.surname}</a></h6> <span class="time"> ${comment.date}</span>
                </div>
                <p>${comment.message}</p>

            </div>
            <c:if test="${userType}">
                <a href="/admin/deleteComment?commentId=${comment.id}&movieId=${comment.movie.id}">X</a>
            </c:if>
        </div>
    </c:forEach>
</div>

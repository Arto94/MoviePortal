<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: XTreme.ws
  Date: 04.03.2018
  Time: 0:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="movieComments" class="mvcast-item">
    <div class="comments">
        <c:forEach items="${comments}" var="comment">
            <div class="cmt-item flex-it">
                <img src="/image?fileName=${comment.user.picUrl}" class="imageForm" alt="">
                <div class="author-infor">
                    <div class="flex-it2">
                        <h6>${comment.user.name} ${comment.user.surname}</h6> <span class="time"> ${comment.date}</span>
                    </div>
                    <p>${comment.message}</p>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="title-hd-sm">

    </div>
    <!-- movie user review -->
</div>
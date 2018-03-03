<%--
  Created by IntelliJ IDEA.
  User: XTreme.ws
  Date: 04.03.2018
  Time: 0:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<div id="movieComments" class="mvcast-item">
    <c:forEach items="${comments}" var="comment">
        <div>
            UserName: <h3>${comment.user.name} ${comment.user.surname} </h3>
            Comment: <p>${comment.message}</p>
        </div>
    </c:forEach>
    <div class="title-hd-sm">

    </div>
    <!-- movie user review -->
</div>

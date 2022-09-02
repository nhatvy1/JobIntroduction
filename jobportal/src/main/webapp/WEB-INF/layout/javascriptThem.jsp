<%-- 
    Document   : javascriptThem
    Created on : Aug 23, 2022, 4:12:27 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="<c:url value="/js/richtext/jquery.richtext.min.js"/>"></script>
<script>
    $(document).ready(function () {
        $('.description').richText();
        $('.experience').richText();
    });
</script>

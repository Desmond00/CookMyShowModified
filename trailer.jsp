<%@include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%out.println(request.getParameter("trailerName"));%>Trailer</title>
<link rel="stylesheet" href="css/background.css?version=1">
<link rel="stylesheet" href="css/form.css?version=1">

<center>
    <video width="1200" height="720" controls autoplay loop>
        <source src=<%out.println(request.getParameter("trailerName"));%> type="video/mp4" />
</center>
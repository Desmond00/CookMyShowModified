<%@include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CookMyShow</title>
<link rel="stylesheet" href="css/background.css?version=1">
</head>
<body>
<div w3-include-html="menu.html"></div>
<center>
<h3 style="color:white;">
<%
	String usr = (String)session.getAttribute("user");
	Cookie ck[] = request.getCookies();
	int no=1;
	for(int i=0;i<ck.length;i++)
	{
		if(ck != null)
		{
			if(ck[i].getName().equals("count"))
			{
				no = Integer.parseInt(ck[i].getValue());
			}
		}
	}
	//out.println(no);
	if(usr != null && no == 1)
		out.println("Welcome "+usr);
%>
</h3>
</center>
</body>
</html>
<%@include file = "viewSlides.jsp"%>
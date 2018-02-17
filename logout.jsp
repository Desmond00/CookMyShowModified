<%
    session.removeAttribute("user");
	session.removeAttribute("userEmail");
	Cookie ck[] = request.getCookies();
	if(ck != null)
	{
		for(int i=0;i<ck.length;i++)
		{
			if(ck[i].getName().equals("count"))
			{
				ck[i].setMaxAge(0);
				response.addCookie(ck[i]);
			}
		}
	}
    response.sendRedirect("/CookMyShowModified/home");
%>
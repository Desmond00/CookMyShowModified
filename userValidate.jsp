<%
    String name = (String)session.getAttribute("user");
    if(name != null)
    {/*
    	String logo = "logo";
    	String user = "img/icon/user1.png";
    	String missing = "icon missing";*/
    	int i,n=1;
    	Cookie ob;
    	Cookie ck[] = request.getCookies();
    	if(ck != null)
    	{
    		for(i=0;i<ck.length;i++)
    		{
    			if(ck[i].getName().equals("count"))
    			{
    				n = Integer.parseInt(ck[i].getValue());
    				n += 1;
    				//out.println("<h3>Number of views : "+n);
        			ob = new Cookie("count",Integer.toString(n));
        			response.addCookie(ob);
        			break;	
    			}
    		}
    		if(i == ck.length)
    		{
    			//out.println("Number of views : "+n);
    			ob = new Cookie("count",Integer.toString(n));
    			response.addCookie(ob);
    		}
    	}
    	else
    	{
    		//out.println("<h3>Number of views : "+n);
    		ob = new Cookie("count",Integer.toString(n));
    		response.addCookie(ob);
    	}
    	//out.println(n);
        out.println("<a id=\"user\" class=\"button\"  href=\"/CookMyShowModified/user\"><img class=\"logo\" src=\"img/icon/user1.png\" alt=\"icon missing\" align=\"middle\">"+name+"</a> <a class=\"button\" id=\"logout\" href=\"/CookMyShowModified/logout\">Log out</a><a class=\"button\" id=\"movies\" href=\"/CookMyShowModified/movies\">Movies</a>"+
        		"<a class=\"button\" id=\"about\" href=\"/CookMyShowModified/about\">About</a>");
    }
    else
        out.println("none");
%>
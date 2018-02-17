<jsp:useBean id="ob" class="admin.addSlides" scope="session"/>
<%--<jsp:setProperty name="ob" property="*"/> --%>
<%
try{
		//out.println("imgURL : "+request.getParameter("img"));
		//out.println("imgName : "+request.getParameter("name"));
		ob.setName(request.getParameter("name"));
		ob.setImg(request.getParameter("img"));
        int t = ob.add();
        if(t>0)
            out.println("<font class=\"reply\">Slide added successfully</font>");
        else
            out.println("error");
    }
    catch(Exception e){out.println(e);}
%>
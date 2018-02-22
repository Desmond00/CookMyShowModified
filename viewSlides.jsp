<%@include file="connect.jsp" %>
<html>
    <head>
        <script>
                

                function plusDivs(n) {
                showDivs(slideIndex += n);
                }

                function showDivs(n)
                {
                    var i;
                    var x = document.getElementsByClassName("mySlides");
                    
                    if (n > x.length) {slideIndex = 1}    
                    if (n < 1) {slideIndex = x.length}
                    for (i = 0; i < x.length; i++) 
                    {
                    x[i].style.display = "none";  
                    }
                    x[slideIndex-1].style.display = "block";  
                }     
            </script>
    </head>
</html>
<%

    try
    {
            PreparedStatement pst=con.prepareStatement("select img_url,video_url from cookslides");
            ResultSet rs=pst.executeQuery();
            %>
            <center>
            
            <button class="left" onclick="plusDivs(-1)">&#10094;</button>
            <button class="right" onclick="plusDivs(1)">&#10095;</button>
        </center>
        <%
        while(rs.next())
        {
            String image=rs.getString(1);
            String video="trailer?trailerName="+rs.getString(2);
            %>
            <body>
                <br>
                <center>
                 <div class="slideshow" style="max-width:500px">
                 <a href=<%=video%>><img class="mySlides" src=<%=image%> style="width:100%"></a>
                 </div>
                   
               </center>
               <script>
                   var slideIndex = 1;
                showDivs(slideIndex);
               </script>
               
               </body>
            <%
              
            }   
            con.close();
        
            
            
            
    }
    catch(Exception e)
    {
        out.println(e);
    }
  %>  



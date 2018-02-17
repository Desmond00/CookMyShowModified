package admin;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


import connect.*;

public class validate{
    int t=0;
    public int check1(HttpServletRequest req) throws SQLException
    {
        Connection con = new Connect().c();
        HttpSession session =  req.getSession();
        String email = (String)session.getAttribute("userEmail");
        if(email != "")
        {
            PreparedStatement ps = con.prepareStatement("select * from cookadmin where email=?");
            ps.setString(1,email);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {t=1;}
        }
        return t;
    }
}
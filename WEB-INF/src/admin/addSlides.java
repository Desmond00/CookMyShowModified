package admin;

import connect.*;

import java.io.IOException;
import java.sql.*;

public class addSlides
{
    String name,img;
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
    
    public int maxid()throws SQLException
    {
        int id=1;
        Connect ob = new Connect();
        Connection con = ob.c();
        try{
            PreparedStatement ps = con.prepareStatement("select max(id) from cookslides");
            //System.out.println("Enterd");
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                id = rs.getInt(1);
                //System.out.println("Inside : "+rs.getInt(1));
                    id +=1;
            }
        }
        catch(Exception e){System.out.println(e);}
        return id;
    }
    public int add()throws SQLException
    {
        Connect ob = new Connect();
        Connection con = ob.c();
        int id = this.maxid();
        PreparedStatement ps = con.prepareStatement("insert into cookslides values(?,?,?)");
        ps.setInt(1,id);
        ps.setString(2,name);
        ps.setString(3,"img/slides/"+img);
        int t = ps.executeUpdate();
        return t;
    }
}
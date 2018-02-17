package admin;

import java.sql.SQLException;

class test
{
    public static void main(String ars[])throws SQLException
    {
        addSlides ob = new addSlides();
        try{
            System.out.println("max id : "+ob.maxid());
        }catch(Exception e)
        {
            System.out.println(e);
        }
    }
}
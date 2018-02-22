<%@include file="menu.jsp"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add slides admin</title>
<link rel="stylesheet" href="css/background.css?version=1">
<link rel="stylesheet" href="css/form.css?version=1">
<jsp:useBean id="ob" class="admin.validate" scope="page"/>
<%
try{
	int t = ob.check1(request);
	if(t == 0)
		response.sendRedirect("addSlides�");
}catch(Exception e){}
%>

<script language="javascript">

var chk=0;

function checknm(nm)
{
	if(nm == "")
		{
		chk = 1;	
		document.getElementById("name1").style.display = "block";
		document.getElementById("name1").innerHTML="<font class=\"reply\">You can't leave this field empty</font>";
		}
	else
		{
		document.getElementById("name1").style.display = "none";
		chk = 2;
		}
}      

function checkfile(file)
{
	if(file == "")
		{
		chk = 1;	
		document.getElementById("file1").style.display = "block";
		document.getElementById("file1").innerHTML="<font class=\"reply\">Select the file</font>";
		}
	else
		{
		document.getElementById("file1").style.display = "none";
		chk = 2;
		}
}

function fileShortName(file)
{
	var pos=0;
    pos = file.length;//getting the length of the image path
    while(file[pos--] != '\\');//parsing till the right most position of \
    file = file.substr(pos+2,file.length);//getting the image name only extracted from the whole path
	return file;
}

function GetXmlHttpObject()
{
	var xmlHttp=null;
	try
	{
		//Firefox, Opera 8.0+, Safari
		xmlHttp = new XMLHttpRequest();
	}
	catch(e)
	{
		//Internet Explorer
		try
		{
		xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		}
		//Google Chrome
		catch(e)
		{
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	return xmlHttp;
}

function fullCheck()
	{
		if(chk == 2)
			{
			document.getElementById("show").style.display = "block";			
			document.getElementById("show").innerHTML = "<font class=\"reply\">Everything is OK, ready to submit</font>"
			var name,img,video;
			name = document.addSlides.imgName.value;
			img = document.addSlides.imgURL.value;
			img = fileShortName(img);
			video = document.addSlides.videoURL.value;
			video = fileShortName(video);
			xmlHttp = GetXmlHttpObject();
			//alert(xmlHttp);
			var url = "addSlides.jsp?name="+name+"&img="+img+"&video="+video;
			alert(url);
			xmlHttp.open("GET",url,true);
			xmlHttp.onreadystatechange = stateChanged2
			xmlHttp.send(null);
			return false;
			}
		else if(chk == 1)
			{
			document.getElementById("show").style.display = "block";
			document.getElementById("show").innerHTML = "<font class=\"reply\">Something is wrong, check every field carefully</font>"
			}
		else if(chk == 0)
			{
			document.getElementById("show").style.display = "block";
			document.getElementById("show").innerHTML = "<font class=\"reply\">Hey, fill up the fields</font>"
			}
		return false;
	}
	
	function stateChanged2()
	{
		var data = xmlHttp.responseText;
		alert(data);
		if(data.trim() == "error")
		{
			document.getElementById("show").style.display = "block";
			document.getElementById("show").innerHTML= "<font class=\"reply\">Some error occurred try again after some time</font>";
		}
		else if(data != "")
		{
			document.addSlides.imgName.value = "";
			document.addSlides.imgURL.value = "";
			document.addSlides.videoURL.value = "";
			document.getElementById("show").style.display = "block";
			document.getElementById("show").innerHTML=data;
		}
	}

</script>
</head>
<body>
<center>
<!-- <div id="cms"></div>-->
<div class="formCont">
<h4>Enter slide details</h4>
	<form name="addSlides" method=post onsubmit="return fullCheck()">
        <input type=text name=imgName placeholder="Slide name" onblur="checknm(this.value)"><br>
        <div id="name1"></div>
		<input type="file" name=imgURL placeholder="Slide image" onblur="checkfile(this.value)"><br><br>
		<input type="file" name=videoURL placeholder="Slide trailer" onblur="checkfile(this.value)"><br><br>
        <div id="file1"></div>
        <div id="show"></div>
        <input type=submit id="upload" value="Upload">
	</form>
</div>
</center>
</body>
</html>
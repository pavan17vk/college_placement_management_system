<?php

	session_start();
		if(!isset($_SESSION['user']))
		{
			header("Location: dbi.php");
		}
		if($_SESSION['user']=='student_int' )
    {
      header("Location: index_student_intern.php");
    }
    if($_SESSION['user']=='student_place' )
    {
      header("Location: index_student_placement.php");
    }
		if($_SESSION['user']=='company')
		{
			header("Location: index_company.php");
		}

?>
<!DOCTYPE html>
<html>
<head>
  <title>Admin notifications</title>
  <link rel="stylesheet" type="text/css" href="1.css"> 
  <link rel="shortcut icon" type="image/png" href="dbi.jpg">
  <link rel="stylesheet" type="text/css" href="stl.css">
</head>
<body >
  <div class="list-unstyled3" >
          <ul>
            <li><a href="dbi.php"><img src="dbi.jpg" alt="DBIT Kumbalagoodu"  class="logo2" height="50"  align="left"/></a></li>
              <li style="float:right"><a  href="logout.php" title="<?php echo $_SESSION['admin_name']; ?> ">Log Out</a></li> 
	            
            <div class="para">
			<p style="color:DodgerBlue:"></p>
            <p> Training &amp; Placement,DBIT Kumbalagoodu</p>
                </div>  
                   </ul>
          
        </div>
		
<!--  <div class="header">
  	<h3> <a style="color:white "href="profile_student2.php">View Profile</a></h3>
  </div>
  <div class="header">
    <h3> <a style="color:white "href="profile_student_update_place.php">Update Profile</a></h3>
  </div>   -->

<div class="index_student_intern">
				<ul class="list-unstyled4 list-horizontal-layout right-align">
						<a href="admin_noti_reg_int.php " class="btn7 ">Registered Students for Internship</a>
						<a href="admin_noti_reg_place.php " class="btn7">Registered Students for Placement</a>
				</ul>
				<ul class="list-unstyled4 list-horizontal-layout right-align">
						<a href="admin_noti_select_int.php " class="btn7 ">Selected Students for Internship</a>
						<a href="admin_noti_select_place.php" class="btn7">Selected Students for Placement</a>
				</ul>
			        <ul class="list-unstyled4 list-horizontal-layout right-align">
						<!-- <a href="profile_student_update_place.php" class="btn7 ">Update Profile</a> -->
						<a href="company.php" class="btn5">Add Company</a>
				</ul>  
</div>

<div class="col-sm-4">
				<h3 class="mg-md  text-right tc-dim-gray">
                                <br>
				<br> <br> <br>
                                  	Training &amp; Placement Office
				</h3>
				<p class="text-right">
					Kumbalagoodu, Mysore Road<br>DON BOSCO Institute of Technology<br>Bangalore-560074
                                 <br> <br>
				
			</div>  
</body>
</html>
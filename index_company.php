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
  if($_SESSION['user']=='admin')
    {
      header("Location: index_admin.php");
    }
?>
<!DOCTYPE html>
<html>
<head>
  <title>Profile of Company</title>
  <link rel="stylesheet" type="text/css" href="1.css"> 
  <link rel="shortcut icon" type="image/png" href="dbi.jpg">
  <link rel="stylesheet" type="text/css" href="stl.css">
</head>
<body >
  <div class="list-unstyled3" >
          <ul>
            <li><a href="dbi.php"><img src="dbi.jpg" alt="DBIT Kumbalagoodu"  class="logo2" height="50"  align="left"/></a></li>
              <li style="float:right"><a  href="logout.php" title="<?php echo $_SESSION['company_name']; ?> ">Log Out</a></li> 
  
            <div class="para">
            <p> Training &amp; Placement,DBIT Kumbalagoodu</p>
                </div>  
                   </ul>
          
        </div>
<!--    
  <div class="header">
    <h3> <a style="color:white "href="profile_student2.php">View Profile</a></h3>
  </div>
  <div class="header">
    <h3> <a style="color:white "href="profile_student_update_place.php">Update Profile</a></h3>
  </div>  -->

<div class="index_student_intern">
        
        <ul class="list-unstyled4 list-horizontal-layout right-align">
            <a href="index_company_details.php" class="btn5 ">Add Details</a>
            
        </ul>
      <!--  <ul class="list-unstyled4 list-horizontal-layout right-align">  -->
            <!--<a href="profile_student2.php" class="btn4 ">View Profile</a> 
            <a href="" class="btn4">Change Student Status</a>
            <a href=" " class="btn5">Notifications</a>
        </ul>     -->
</div>

<div class="col-sm-4">
        <h3 class="mg-md  text-right tc-dim-gray">
          Training &amp; Placement Office
        </h3>
        <p class="text-right">
          Kumbalagoodu, Mysore Road<br>DON BOSCO Institute of Technology<br>Bangalore-560074
        </p>
      </div>    
</body>
</html>
<?php
 //header("Location: logout.php");

?>
<?php
include_once ("link.php");
if (isset($_GET)){
    $query="SELECT * FROM droplist   JOIN hairsource   ON droplist.hair=hairsource.id";
    $whereFlag=false;
    if (isset($_GET['hair'])){
        $tmp=$_GET['hair'];
        $query= $query." AND hairsource.hair_color='$tmp'";
    }
    $query=$query. " JOIN countrysource ON droplist.country=countrysource.id";

    if (isset($_GET['country'])){
        $tmp=$_GET['country'];
        $query=$query." AND countrysource.country_name='$tmp'";
    }
    $query=$query. " JOIN citysource  ON droplist.city=citysource.id";
    if (isset($_GET['city'])){
        $tmp=$_GET['city'];
        $query=$query." AND citysource.city_name='$tmp'";
    }

    if (isset($_GET['age'])){
        $tmp=$_GET['age'];
        if (!$whereFlag) {
            $query=$query . " WHERE age='$tmp'";
        }
        else{
            $query=$query . " AND age='$tmp'";
        }
        $whereFlag=true;
    }

    if (isset($_GET['name'])){
        $tmp=$_GET['name'];
        if (!$whereFlag) {
            $query=$query . " WHERE name='$tmp'";
        }
        else{
            $query=$query . " AND name='$tmp'";
        }
        $whereFlag=true;
    }

    if (isset($_GET['sex'])){
        $tmp=$_GET['sex'];
        if (!$whereFlag) {
            $query=$query . " WHERE sex='$tmp'";
        }
        else{
            $query=$query . " AND sex='$tmp'";
        }
        $whereFlag=true;
    }

    $mysqli=mysqli_query($link,$query);

    $result=[];
    while($row=mysqli_fetch_assoc($mysqli)){
        array_push($result,$row);
    }
    echo json_encode($result);


}
// SELECT * FROM droplist   JOIN hairsource   ON droplist.hair=hairsource.id AND hairsource.hair_color="Блонд"   JOIN countrysource ON droplist.country=countrysource.id  JOIN citysource  ON droplist.city=citysource.id WHERE age=21 
?>
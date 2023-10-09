<?php
include_once("link.php");

$result=mysqli_query($link,"SELECT * FROM droplist  JOIN  hairsource  ON droplist.hair=hairsource.id  JOIN countrysource ON droplist.country=countrysource.id  JOIN citysource  ON droplist.city=citysource.id");
$droplistName=[];
$droplistAge=[];
$droplistSex=[];
$droplistHair=[];
$droplistCountry=[];
$droplistCity=[];
while($test=mysqli_fetch_assoc($result)){
    if(!in_array($test['name'],$droplistName)){
        array_push($droplistName,$test['name']);
    }
    if(!in_array($test['age'],$droplistAge)){
        array_push($droplistAge,$test['age']);
    } 
    if(!in_array($test['sex'],$droplistSex)){
        array_push($droplistSex,$test['sex']);
    } 
    if(!in_array($test['hair_color'],$droplistHair)){
        array_push($droplistHair,$test['hair_color']);
    } 
    if(!in_array($test['country_name'],$droplistCountry)){
        array_push($droplistCountry,$test['country_name']);
    } 
    if(!in_array($test['city_name'],$droplistCity)){
        array_push($droplistCity,$test['city_name']);
    }  

}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <select name="name" id="">
    <option value=""></option>
    <?php 
    foreach($droplistName as $name){
        echo <<<EOF
        <option value="$name">$name</option>
        EOF;
    }
    ?>
    </select>

    <select name="age" id="">
    <option value=""></option>
    <?php 
    foreach($droplistAge as $age){
        echo <<<EOF
        <option value="$age">$age</option>
        EOF;
    }
    ?>   
    </select>

    <select name="sex" id="">
    <option value=""></option>
    <?php 
    foreach($droplistSex as $sex){
        echo <<<EOF
        <option value="$sex">$sex</option>
        EOF;
    }
    ?>  
    </select>
    
    <select name="hair" id="">
    <option value=""></option>
    <?php 
    foreach($droplistHair as $hair){
        echo <<<EOF
        <option value="$hair">$hair</option>
        EOF;
    }
    ?>   
    </select>
   
    <select name="country" id="">
    <option value=""></option>
    <?php 
    foreach($droplistCountry as $country){
        echo <<<EOF
        <option value="$country">$country</option>
        EOF;
    }
    ?>  
    </select>
    
    <select name="city" id="">
    <option value=""></option>
    <?php 
    foreach($droplistCity as $city){
        echo <<<EOF
        <option value="$city">$city</option>
        EOF;
    }
    ?>  
    </select>
    <input type="button" value="ОТПРАВИТЬ" id="send">
    <table>
        
    </table>
    <script src="script.js"></script>
</body>
</html>
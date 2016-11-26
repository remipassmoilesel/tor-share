<?php

$clean_room=strip_tags( (strlen($_GET['room']) > 200) ? substr($_GET['room'],0,200) : $_GET['room'] );
echo "woot";

header('Location: /?room='.$_GET["room"]);
if (file_get_contents("rooms/".$clean_room.".txt") != "" ){
   rename ('rooms/'.$clean_room.'.txt', "log/".$clean_room.log.time().".txt");
   file_put_contents('rooms/'.$clean_room.'.txt', '');
   file_put_contents('rooms/'.$clean_room.'clear.txt', "The $clean_room chat was cleared by a user at IP:<strong>".$_SERVER['REMOTE_ADDR']." </strong>at ". date('m/d/Y h:i:s a', time())." EST(GMT-4:00)<br>\n");
} 

exit;
?>

<?php

if (isset($_POST["room"]) && !empty($_POST["room"])) {
    $room = preg_replace("/[^A-Za-z0-9 ]/", '', $_POST["room"]);
    echo file_get_contents("rooms/" . $room . ".txt");
}
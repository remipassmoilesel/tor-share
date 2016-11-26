<?php
function processString($s) {
    return preg_replace('@((https?://)?([-\w]+\.[-\w\.]+)+\w(:\d+)?(/([-\w/_\.]*(\?\S+)?)?)*)@', '<a target="_blank" href="$1">$1</a>', $s);
}

$unsafe = array(".", "!", "/", ";", "!", "?", "$", "#", "*", "'", '"');
$clean_room = str_replace($unsafe, "", strip_tags((strlen($_GET['room']) > 200) ? substr($_GET['room'], 0, 200) : $_GET['room']));
$clean_data = processString(strip_tags((strlen($_GET['message']) > 500) ? substr($_GET['message'], 0, 500) : $_GET['message']));
$clean_user = strip_tags((strlen($_GET['user']) > 15) ? substr($_GET['user'], 0, 15) : $_GET['user']);

if ($clean_data == "" || $clean_user == "") exit;
$message = '<div itemscope itemtype="https://schema.org/CommunicateAction" class="message"><div itemprop="about" class="content">' . $clean_data . '</div><div class="meta"><span itemprop="participant" class="username">' . $clean_user . '</span> &#8226; <span itemprop="startTime" class="timestamp">' . time() . '</span></div></div>'."\r\n";
$file_data = file_get_contents('rooms/' . $clean_room . '.txt') . $message;
file_put_contents('rooms/' . $clean_room . '.txt', $file_data);

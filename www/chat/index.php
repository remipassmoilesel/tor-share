<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6 lte9 lte8 lte7" lang="en"><![endif]-->
<!--[if IE 7 ]><html class="ie ie7 lte9 lte8 lte7" lang="en"><![endif]-->
<!--[if IE 8 ]><html class="ie ie8 lte9 lte8" lang="en"><![endif]-->
<!--[if IE 9 ]><html class="ie ie9 lte9" lang="en"><![endif]-->
<!--[if gt IE 9]><!--><html class="" lang="en"><!--<![endif]-->
<head>
    <meta name='copyright' content='Copyright 2014. CASUAL-Dev Ms-RL License http://www.microsoft.com/en-us/openness/licenses.aspx'>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta property="og:title" content="CASUAL-Dev chipbox Minimal Chat Extreme"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="http://chat.casual-dev.com"/>
    <meta name=viewport content="width=device-width, initial-scale=1,user-scalable=no">
    <meta property="languate" content="english"/>
    <meta property="recipient" content="everyone"/>
    <meta property="agent" content="user"/>
    <meta property="instrument" content="CASUAL-Dev chat"/>
    <meta property="participant" content="user"/>

    <title>Tor-sharing Minimal Chat Extreme</title>

	<style>
		<?php echo file_get_contents('css/style.css'); ?>
	</style>

</head>
<body id="body" itemscope itemtype="https://schema.org/CommunicateAction">
    <div class="header">
        <div class="menubutton">Tor-sharing Minimal Chat</div>
        <div class="more has-menu">
            <i class="fa fa-ellipsis-v"></i>
            <div class="menu">
                <ul>
                    <li><label class="clear">Clear Chat</label></li>
                    <li><label class="change-username">Change Username</label></li>
                    <li class="notifications"><label>Enable sounds <input type="checkbox" class="enable-notifications"></label></li>
                </ul>
            </div>
        </div>
        <div class="name"></div>
    </div>

    <div class="chatarea">
    </div>
    <div class="inputarea">
        <input class="message" type="text" placeholder="Send chat message"/>
        <div class="send"><i class="fa fa-play"></i></div>
    </div>

    <div class="username-dialog dialog">
        <p class="title">Change Username</p>
        <input type="text" placeholder="Username" class="username"/>
        <div class="button submit">Update</div><div class="button cancel">Cancel</div>
        <div class="clear"></div>
    </div>

    <!--Footer Scripts-->
    <script type="application/ld+json">
      {
        "@context": "http://schema.org",
        "@type": "CommunicateAction",
        "agent": {
          "@type": "Person",
          "name": "User"
        },
        "recipient": {
          "@type": "Person",
          "name": "User"
        }
      }

    </script>
    <script>
        <?php if(isset($_GET["room"]) && !empty($_GET["room"])){
                $room = $_GET["room"];
            }else {
                $room = "N";
            }
            ?>
        var room = <?php echo '"'.$room.'"'; ?>
    </script>
    <script src="bower_components/jquery/dist/jquery.js"></script>
    <script src="js/scripts.min.js"></script>
    <link href="bower_components/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.ico">
</body>

</html>

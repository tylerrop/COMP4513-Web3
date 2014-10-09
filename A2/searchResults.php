<?php 

	require_once('checkLogIn.php');
	require_once('config.php');

	$title = 'Search Results' . TITLEADDON; 

	$content = '
	<div class="container roundCorners">
		<div class="jumbotron roundCorners medPadding">
			<h1 class="noPadding noMargins bold">Search Results</h1> 
      		<h2 class="noMargins"><small><span class="orangeText">This feauture is still under construction, check back soon for searching!</span></small></h2>
	    	<p></p>
	    </div>
	</div>
	'; 

	require_once('master.php');

?>
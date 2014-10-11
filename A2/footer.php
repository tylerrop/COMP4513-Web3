

<!-- <div class="footer">
    <div class="container">
    	<p class="text-muted">Place sticky footer content here.</p>
    </div>
</div> -->



<?php

	// if js is enabled
	
	echo '<script type="text/JavaScript" src="/js/js1.js"></script>';
	
	$jQueryLocal = '<script src="/js/jquery-1.11.1.min.js"><\/script>';

    echo ' <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    	   <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>

           <script type="text/javascript">

                window.jQuery ||
                document.write("'.$jQueryLocal.'");

            </script>
         ';
?>

</body>
 
</html>
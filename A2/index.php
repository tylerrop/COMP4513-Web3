<?php 

require_once('checkLogIn.php');
require_once('config.php');

$title = 'Home' . TITLEADDON; 

function printFiveNewestPrograms()
{
	$tableRows = "";
    // table that we'll read from
  

    $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);

    // check connection
    if (mysqli_connect_errno()) 
    {
        printf("Connect failed: %s\n", mysqli_connect_error());
        exit();
    }

    // always use SQL protection.
    $sqlStatement = "SELECT request.*, createprogramrequest.*, users.* 
    				 FROM `request`, `createprogramrequest`, `users` 
    				 WHERE request.id = createprogramrequest.id AND request.userId = users.userID 
    				 ORDER BY request.id DESC LIMIT 5;";
    $result = mysqli_query($connection, $sqlStatement);

    //reading through table rows to create opton values for the selector
    while ($row = mysqli_fetch_array($result)) 
    {	
    		$tableRows .= '<tr>
			            <td><a href="singleProgram.php?programRequestID='.$row["id"].'&type='.$row["type"].'">'.$row["id"].'</a></td>
			            <td><a href="singleProgram.php?programRequestID='.$row["id"].'&type='.$row["type"].'">'.$row["programName"].'</a></td>
			            <td class="requestName">'.$row["firstname"].' '.$row["lastname"].'</td>
			            <td><a href="mailto:'.$row["username"].'?Subject='.$row["programName"].'">'.$row["username"].'</a></td>
			            <td class="requestCreation">'.$row["creationDate"].'</td>
			            <td class="requestState">'.$row["state"].'</td>
			          </tr>
			          ';
    }

    // clode db connection
    mysqli_close($connection);

    return $tableRows;

}

$content = '
	<div class="container roundCorners">
		<div class="jumbotron roundCorners medPadding">
			<h1 class="noPadding noMargins bold">Home</h1> 
	    	<h2 class="noMargins"><small>Welcome to MRU Curriculum Online.<br/>
	    						  	<span class="orangeText">This application is currently under development, some features are still being implimented. 
	    							</span>
	    						  </small>
	    	</h2>

	    	<p></p>
			
	        <div class="btn-group">
	          <a href="createProgram.php" class="btn btn-warning">Create Program Request</a>
	        </div>

	        <div class="btn-group">
	          <a href="viewPrograms.php" class="btn btn-warning">All Program Requests</a>
	        </div>

	        <div class="btn-group">
	          <a href="yourPrograms.php" class="btn btn-warning">Your Requests</a>
	        </div>

	        <div class="btn-group">
	          <a href="yourPendingProgramApprovals.php" class="btn btn-warning">Pending Your Approval</a>
	        </div>

	        <div class="btn-group">
	          <a href="approvedPrograms.php" class="btn btn-warning">Approved Programs</a>
	        </div>

	        <div class="btn-group">
	          <a href="unapprovedPrograms.php" class="btn btn-warning">Unapproved Programs</a>
	        </div>

	        <p></p>
	        

	        <p><small>Click the ID or Title to view the Submission individually.</small></p>
	        
	        <div class="panel panel-default noMargins">
			    	<div class="panel-heading bold">Newest Program Requests</div>
			    	<small>
			    	<!-- Table -->
				    <table class="table noMargins">
				        <thead>
				     	    <tr>
				        		<th>ID</th>
				           		<th>Title</th>
				            	<th class="requestName">Submitted By</th>
				            	<th>Email</th>
				            	<th class="requestCreation">Creation Date</th>
				            	<th class="requestState">State</th>
				            </tr>
				        </thead>
				        
				        <tbody>
				        '.printFiveNewestPrograms().'
				        </tbody>
				      </table>    		
				      </small>		
   				</div>
   				<!-- end of panel-->

	    	
	    </div>
	</div>
	'; 

require_once('master.php');

?>

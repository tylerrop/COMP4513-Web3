$(document).ready(function()
{
	// make the active Content Area visible is the user has JS enabled
	$(".invisible").removeClass('invisible');

	
	// once an input is changed (Program Name, Term) then they are updated
	$(":input").change(function()
	{
 
	      programName = $('input[name="programName"]').val();
  		  term = $('select[name="fct"]').val();

  		  $(".enteredInfo > div").empty();
  		  $(".enteredInfo > div").append(programName + " " + term); 
	});
    
 
 
 	
	// ensure that all form fields are filled out...
	$('#createRequestForm :submit[name="submitProgram"]').on("click", function() 
	{
  		$('.required').each(function() 
  		{
    		if ( ($(this).val()) == "" ) 
    		{ 
      			$(this).addClass("highlight");
      			$(this).css('border', '1px solid #f0ad4e');
      			$(this).css('background-color', 'rgb(255, 238, 214)');
    		}
    		else
    		{
    			$(this).removeClass("highlight");
    			$(this).css('border', '1px solid #cccccc');
    			$(this).css('background-color', '#FFF');
    		}
  		});

  		if ($('.required').hasClass('highlight')) 
  		{
    		alert("Please fill in all fields to submit your Program Request.");
    		return false;
  		}
	}); 



});


 
    

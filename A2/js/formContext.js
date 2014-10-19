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
    
 
 
});


 
    

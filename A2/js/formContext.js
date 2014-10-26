$(document).ready(function()
{
	// make the active Content Area visible is the user has JS enabled
	$(".invisible").removeClass('invisible');
  $('form[name="searchBox"]').attr('method', "GET");

	
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


  // variable to hold request
  // var request;
  // var currentPage = ($(location).attr('href'));
  // alert(currentPage);

  // if (currentPage.search("searchResultsASYNC.php") > -1 )
  // {
  //   // ajax search results
  //   $('form[name="searchBox"]').submit(function(event)
  //     {

  //       // search term
  //       var searchVal = $('input[name="query"]').val();
  //       // get the search page url
  //       var formURL = "searchResultsASYNC.php";

  //       // setup some local variables
  //       var $form = $(this);
  //       // serialize the data in the form
  //       var serializedData = $form.serialize();

  //       request = $.ajax(
  //                      {
  //                         url: formURL,
  //                         type: "POST",
  //                         async: true,
  //                         // data: serializedData,
  //                         data: searchBox,
  //                         dataType: 'json',
  //                         success: function(data)
  //                         {
  //                           alert("success");
  //                           // $("#result").html('Submitted successfully'+ response);
  //                           $("#result").fadeIn(1000).append('<div>' + data.posted + '</div>')

  //                         }
  //                       }
  //                       );

  //        // callback handler that will be called on success
  //       request.done(function (response, textStatus, jqXHR)
  //       {
  //         // log a message to the console
  //         alert("Hooray, it worked!");
  //       });

  //       // callback handler that will be called on failure
  //       request.fail(function (jqXHR, textStatus, errorThrown)
  //       {
  //         // log the error to the console
  //         alert(
  //               "The following error occured: "+
  //               textStatus, errorThrown
  //              );
  //       });

  //        // prevent default posting of form
  //       event.preventDefault();

      

      


  //       // $.post(formURL, {query:searchVal}).done(function(result)
  //       // $.post(formURL, (function(result)
  //       //                                         {
  //       //                                           alert(result)
  //       //                                           $('#result').html(result)
  //       //                                         }
  //       //                                        )
        

  //        // form.submit();

  //   })

  // }
  



  var currentPage = ($(location).attr('href'));
  // alert(currentPage);

  if (currentPage.search("searchResultsASYNC.php") > -1 )
  {

        /* When the user enters a value such as "j" in the search box
         * we want to run the .get() function. */
        $('input[name="query"]').keyup(function() 
        { 
            /* Get the value of the search input each time the keyup() method fires so we
             * can pass the value to our .get() method to retrieve the data from the database */
            var searchVal = $(this).val();

            /* If the searchVal var is NOT empty then check the database for possible results
             * else display message to user */
            if(searchVal !== '') 
            {
                 
                /* Fire the .get() method for and pass the searchVal data to the
                 * search-data.php file for retrieval */
                // $.get('data/search-data.php?searchData='+searchVal, function(returnData) {
                  $.get('search-data.php',{query:searchVal}, 
                    function(returnData) 
                    {
                      /* If the returnData is empty then display message to user
                       * else our returned data results in the table.  */
                      if (!returnData) 
                      {
                        $('#results').html('=Search term entered does not return any data.');
                      } 
                      
                      else 
                      {
                        // $('#results').html("");
                        $('#results').html(returnData);
                        $('table.tableSorter').tableSort(getTableData());
                        // $('#results').innerHTML(returnData);
                      }
                  
                    });

            } 

            else 
            {
                // $('#results').html('No Results found');
            }

        });
  

  }

});


 
    

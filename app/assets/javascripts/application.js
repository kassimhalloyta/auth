// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//= require jquery
//= require jquery_ujs
//= require jquery_ujs


//= require dataTables/jquery.dataTables
//= require_tree .
//= require announcements

$(document).ready(function()
{
	
    $('#audio_list').dataTable({   		
       
      "sPaginationType": "full_numbers",
       "iDisplayLength": 25,
        "aLengthMenu": [5,10,15,25, 50, 100, 150],
         "aaSorting": [] ,
          "oLanguage": 
          {  
          	"sSearch":"Gunnus :"
    
          }
   } );
   
  $('#audio_edit').dataTable({           
          
          "sPaginationType": "full_numbers",
          "iDisplayLength": 15,
          "aLengthMenu": [5,10,15,25, 50, 100, 150],
           "bJQueryUI": true
           
          //   "sLengthMenu": "Display _MENU_ records per page",
          //   "sInfo": "Displaying _START_ to _END_ of _TOTAL_ records",
          //   "sInfoEmpty": "Showingo 0 to 0 of 0 records",
          //   "sInfoFiltered": "(filtered from _MAX_ total records)"
       
    } );
  
} );



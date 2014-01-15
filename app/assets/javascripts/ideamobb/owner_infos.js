$(document).ready(function(){
    $("#owner_info_video_url").bind('paste',function(w){
       var link = $("#owner_info_video_url");
       setTimeout(function(e) {
              var self = this;
               $.ajax('/preview', {
                   type: 'POST',
                   dataType: 'json',
                   data:  {videourl: $(link).val()},
                   success: function(data, textStatus, jqXHR) {
                       $("#videotube").html(data['responseText']);
                    },
                   error: function(data) {
                       $("#videotube").html(data['responseText']);
                    }
               });
        
       }, 5);
    });
});


$('#submit-ownerinfo').bind('click', function(e){
    e.preventDefault();
    $("#ownder_info_form").submit();
})




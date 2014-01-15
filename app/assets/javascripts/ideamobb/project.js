$('#submit-project').bind('click', function(e){
    e.preventDefault();
    $("#project_form").submit();
})

$('#popup-start').bind('click', function(e){
    e.preventDefault();
    $("#country_form").submit();
})

$('#project_select_funding_date').click(function() {
    var dateToday = new Date();
    $( "#project_funding_deadline" ).datepicker({
        minDate: dateToday
    });
    $("project_funding_deadline").val = "";
})

$('#project_select_funding_days').click(function() {
    $( "#project_funding_deadline" ).datepicker("destroy");
    $("project_funding_deadline").val("");
})

function callback_donation(){
    $(".noavail").unbind('change');
    $(".noavail").bind('change', function(e){
    console.log($(this))
    if($(this).is(':checked')){
        $("#"+$(this).attr("id")+"_input").show()
    }
    else{
        $("#"+$(this).attr("id")+"_input").val("")
        $("#"+$(this).attr("id")+"_input").hide()
    }
    })
}
callback_donation();

$('#send-verify').bind('click', function(e){
    e.preventDefault();
    $("#new_account_verify").submit();
})

$('#submit-accountform').bind('click', function(e){
    e.preventDefault();
    $("#new_account_verify").submit();
})
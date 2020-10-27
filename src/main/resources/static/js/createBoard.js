$(document).ready(function(){
	  $("#add_hw").click(function(){
	    $('#list').append($("#element").html());
	  });
	  $('#list').on('click', '.added', function() {
	    $(this).remove();
	  });
	
	  $('#deadline_check').change(function() {
	        if(this.checked) {
	          $("#deadline").hide();
	        }
	        else{
	          $("#deadline").show();
	        }
	  });

	$('#radio_make').change(function(){
	  $("#make_div").show();
	  $("#add_form").show();
	  $("#button_place").show();
	
	  $("#link_div").hide();
	  $("#title_create").html("모임생성");
	});
	$('#radio_link').change(function(){
	  $("#make_div").hide();
	  $("#add_form").hide();
	  $("#button_place").hide();
	
	  $("#link_div").show();
	  $("#title_create").html("모임참가");
	});
	
	$(document).on("click", ".delete", function() {
	    $(this).parent().remove();
	});
	
	$('#duplicate_check').on('click', function(){
        var data = {
                link: $('#duplicateLink').val()
        }
        $.ajax({
            url: "/duplicateCheck",
            type: "POST",
            data: data,
            success: function(data){
            console.log(data);
             if(data == true){
             	$('#duplicateLink').val("");
             	alert("중복된 link입니다. 다시 입력해주세요!!");
             	
             }else{
             	alert("사용할 수 있는 링크입니다!!");
             	$('#duplicate').val("true");
             }
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
    });

});
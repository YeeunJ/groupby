$(document).ready(function(){
	  $("#add_hw").click(function(){
	    $('#list').append($("#element").html());
	  });
	  $('#list').on('click', '.added', function() {
	    $(this).remove();
	  });
	
	  $('#duplicate_check').click(function(){
	    alert("사용할 수 있는 링크입니다.");
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
	  $("#title").html("모임생성");
	});
	$('#radio_link').change(function(){
	  $("#make_div").hide();
	  $("#add_form").hide();
	  $("#button_place").hide();
	
	  $("#link_div").show();
	  $("#title").html("모임참가");
	});
	
	$(document).on("click", ".delete", function() {
	    $(this).parent().remove();
	});


});
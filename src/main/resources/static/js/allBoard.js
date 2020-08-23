$(document).ready(function(){
	var ctx = document.getElementById('myChart').getContext('2d');
	var chart = new Chart(ctx, {
	  // 챠트 종류를 선택
	  type: 'line',
	  // 챠트를 그릴 데이타
	  data: {
	    labels: ['8/17', '8/18', '8/19', '8/20', '8/21', '8/22', '8/23'],
	    datasets: [{
	      label: '미션수행개수',
	      backgroundColor: 'transparent',
	      borderColor: 'red',
	      data: [0, 10, 5, 2, 20, 30, 45]
	    }]
	  }, // 옵션
	  options: {}
	});
});

//차트 로딩
google.charts.load('current', {packages: ['corechart']});
google.charts.setOnLoadCallback(drawWeight);
google.charts.setOnLoadCallback(drawBMI);
google.charts.setOnLoadCallback(drawPieChart);
google.charts.setOnLoadCallback(drawBarChart);

//데이터, 옵션 입력
function drawWeight() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', '날짜');
      data.addColumn('number', '나');
      //DB에서 데이터 가져오기 ['날짜',몸무게]
      data.addRows([
    	  [1, 40],  [2, 43],  [3, 45],  [4, 48],  [5, 50],
          [6, 41],  [7, 57],  [8, 43],  [9, 40],  [10, 42], [11, 45],
          [12, 40], [13, 40], [14, 42], [15, 47], [16, 44], [17, 48],
          [18, 52], [19, 54], [20, 42], [21, 55], [22, 56], [23, 57],
          [24, 60], [25, 55], [26, 52], [27, 51], [28, 49], [29, 53],
          [30, 55], [31, 58]        
      ]);

      var options = {
    	//x축
    	title : '몸무게',
        hAxis: {        	
          title: '날짜',
          minValue: 1, 
          maxValue: 31, 
          ticks: [5,10,15,20,25,30]          
        },
        //y축
        vAxis: {          
          //minValue: 30           
        },  
        height: 500,
        chartArea:{
            backgroundColor: {
                fill: '#8FCEFF',
                fillOpacity: 0.2
            }
        },
        
        backgroundColor: {
            fill: '#f1f3f5'
          },
        
      //라인의 색상
        series: {
        	0: {color: '#003bfb'}        	
        }
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));      
      chart.draw(data, options);      
      
      //반응형 크기 조절
      window.addEventListener('resize', drawWeight, false);
    }

function drawBMI() {
	
	var data = new google.visualization.DataTable();
    data.addColumn('number', '날짜');
    data.addColumn('number', '나');
    data.addColumn('number', '정상');

    data.addRows([
      [1, 23, 21], [2, 22, 21], [3, 21, 21],
      [4, 20, 21], [5, 19, 21], [6, 18, 21],
      [7, 25, 21], [10, 19, 21], [11, 19, 21],
      [15, 21, 21], [16, 22, 21], [17, 18, 21],    
      [20, 23, 21], [24, 20, 21], [30, 19, 21]      
    ]);

	    var options = {
		hAxis : {
		title : '날짜',
		ticks: [5,10,15,20,25,30],
		maxValue: 31
		},
		chartArea:{
            backgroundColor: {
                fill: '#8FCEFF',
                fillOpacity: 0.2
            },
            'width': '100%'
        },
        height: 250,
		vAxis : {
			
			value : 4,
			height: 500,
			ticks: [15, 20, 25, 30]
		},
		 backgroundColor: {
	            fill: '#E6EBFF'
	     }
	};
	var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));
	chart.draw(data, options);

	//반응형 크기 조절
	window.addEventListener('resize', drawBMI, false);
}


function drawPieChart() {
	var data = google.visualization.arrayToDataTable([
        ['Nutrient', 'Day per amount'],
        ['탄수화물',  290],
        ['단백질', 132],
        ['지방', 61],
        ['기타', 9]
        
      ]);

      var options = {
        slices: {
            0: { color: '#005bfb' },
            1: { color: '#008afb' },
            2: { color: '#00affb' },
            3: { color: '#00d8fb' }
          },
          chartArea:{
             'width':'100%'
          },
        height: 250,
        width:'100%',
        backgroundColor: {
            fill: '#E6EBFF'
        }
      };

      var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));

      chart.draw(data, options);
      
    //반응형 크기 조절
  	window.addEventListener('resize', drawPieChart, false);
}

function drawBarChart() {
	 var data = google.visualization.arrayToDataTable([
	        ['날짜', '이번달', '지난달'],
	        ['1일', 60, 65],
	        ['8일', 58, 60],
	        ['15일', 59, 58],
	        ['22일', 60, 59],
	        ['29일', 55, 60]
	      ]);

	      var options = {
	        hAxis: {
	          title: '몸무게(Kg)',
	          minValue: 30
	        },
	        vAxis: {
	          //title: '날짜'
	        },
	        chartArea:{
	             'width':'100%'
	          },
	        height: 250,
	        series: {
	            0: { color: '#005bfb' }, 
	            1: { color: '#00affb' } 
	          },
	        backgroundColor: {
		       fill: '#E6EBFF'
		     }  
	      };

	      var chart = new google.visualization.BarChart(document.getElementById('chart_div4'));
	      chart.draw(data, options);
	      
	    //반응형 크기 조절
	  	window.addEventListener('resize', drawBarChart, false);
}

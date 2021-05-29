//차트 로딩
google.charts.load('current', {packages: ['corechart']});
google.charts.setOnLoadCallback(drawWeight);
google.charts.setOnLoadCallback(drawBMI);
google.charts.setOnLoadCallback(drawPieChart);

var nowMonthInt = parseInt(nowMonth);
var acceessableCount = 1;

//1~12월만 선택되기
function limitMonth(num) {
	if(num < 1){
		return 12;
	}
	if(num > 12){
		return 1;
	}
	return num;
}

//이전버튼
function preMonth() {
	--nowMonthInt;
	nowMonthInt = limitMonth(nowMonthInt);
	acceessableCount = acceessableCount - 1;	
	if (acceessableCount <= 0) {
		drawWeight(nowMonthInt);
		drawBMI(nowMonthInt);
	} else {
	}	
	acceessableCount = acceessableCount + 1;
}


// 다음버튼
function nextMonth() {
	++nowMonthInt;
	nowMonthInt = limitMonth(nowMonthInt);
	acceessableCount = acceessableCount - 1;	
	if (acceessableCount <= 0) {
		drawWeight(nowMonthInt);
		drawBMI(nowMonthInt);
	} else {
	}	
	acceessableCount = acceessableCount + 1;		
}

// 데이터, 옵션 입력
function drawWeight(searchMonth) {
	  var memberWeight = ""; 
	  
	
	  var datas = $.ajax({
		url : contextPath + "/member/bodyChartList.me?searchMonth=" + searchMonth,		
		type : "get",
		dateType : "json",
		async : false
	  }).responseText;
	
	
      var data = new google.visualization.DataTable();
      
      data.addColumn('number', '날짜');
      data.addColumn('number', '나');
      
      datas = JSON.parse(datas);
      
      data.addRows(datas.length);
           
      $.each(datas, function(index, minfo) {					
    	  data.setCell(index,0,minfo.BODYDAY);
    	  data.setCell(index,1,minfo.BODYWEIGHT);    	  
		});
     
      var options = {
    	//x축
    	title : nowMonthInt + '월 몸무게 그래프',
        hAxis: {        	
          title: '날짜',
          minValue: 1, 
          maxValue: 31, 
          ticks: [5,10,15,20,25,30]          
        },
        //y축
        vAxis: {
          
          minValue: 30,
          ticks: [30, 45, 60, 75] 
        },  
        height: 300,
      //라인의 색상
        series: {
        	0: {color: '#003bfb'}        	
        },
      //차트 배경색상
        chartArea:{
        	backgroundColor: {
        		fill: '#8FCEFF',
        		fillOpacity: 0.2
        	}        	
        }
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));      
      chart.draw(data, options);      
      
      //반응형 크기 조절
      window.addEventListener('resize', drawWeight, false);
    }

function drawBMI(searchMonth) {
	
	  var datas = $.ajax({
		url : contextPath + "/member/bodyChartList.me?searchMonth=" + searchMonth,		
		type : "get",
		dateType : "json",
		async : false
	  }).responseText;
	  
	  datas = JSON.parse(datas); 
	  
	  
	var data = new google.visualization.DataTable();
    data.addColumn('number', '날짜');
    data.addColumn('number', '나');
    data.addColumn('number', '정상');
    
    data.addRows(datas.length);
    
    $.each(datas, function(index, minfo) {	      
      var weight = minfo.BODYWEIGHT;      
      var bmi = weight/((height * height)/10000);
  	  data.setCell(index,0,minfo.BODYDAY);
  	  data.setCell(index,1,bmi.toFixed(1));  
  	  data.setCell(index,2,21);
		});
    
	    var options = {
		title : 'BMI지수',
		hAxis : {
		title : '날짜',
		ticks: [5,10,15,20,25,30],
		maxValue: 31
		},		
		vAxis : {
			
			value : 4,
			ticks: [15, 20, 25, 30]
		},
		height: 300,
		width:'100%',
		//라인의 색상
        series: {
        	0: {color: '#003bfb'}        	
        },
      //차트 배경색상
        chartArea:{
        	backgroundColor: {
        		fill: '#8FCEFF',
        		fillOpacity: 0.2
        	}        	
        }		
	};
	var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));
	chart.draw(data, options);

	//반응형 크기 조절
	window.addEventListener('resize', drawBMI, false);
}

function drawPieChart(data1, data2) {
	var data = new google.visualization.DataTable();
    data.addColumn('string', '대상');
    data.addColumn('number', 'day');
    data.addRows([
      ['출석', attendRate],
      ['결석', nowMonthEnd - attendRate],
      
    ]);

    var options = {
      title: '월별  출석률',
      sliceVisibilityThreshold: .2,
      chartArea:{
          'width':'70%',
          'height':'70%'
        	  
       } 
    };

      var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));

      chart.draw(data, options);
      
    //반응형 크기 조절
  	window.addEventListener('resize', drawPieChart, false);
}
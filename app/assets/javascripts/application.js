// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

function draw_bar_chart(){
  var data = google.visualization.arrayToDataTable(build_weather_data());
  var options = {
    chart: {
      title: 'Temperature (in Farenheit)'
    },
    bars: 'vertical',
    // isStacked: true
  };
  var chart = new google.charts.Bar(document.getElementById('bar_graph'));
  chart.draw(data, google.charts.Bar.convertOptions(options));
}

function draw_line_chart(){
  var data = google.visualization.arrayToDataTable(build_weather_data());
  var options = {
    titleTextStyle: {fontSize: '18'},
    width: 900,
    height: 200,
    hAxis: {
      title: 'Date',
      textStyle: {
        fontSize: 10,
        color: '#053061',
        bold: false,
        italic: false
      },
      titleTextStyle: {
        fontSize: 12,
        color: '#053061',
        bold: false,
        italic: false
      }
    },
    vAxis: {
      title: 'Temperature',
      textStyle: {
        fontSize: 12,
        bold: false,
        italic: false
      },
      titleTextStyle: {
        fontSize: 12,
        bold: false,
        italic: false
      }
    },
    animation: {
      duration: 500,
      startup: true,
      easing: 'linear',
    },
  };
  var chart = new google.visualization.LineChart(document.getElementById('line_chart'));
  chart.draw(data, options);
}

function build_weather_data(){
  var data_table_array = [['Date', 'High Temperature', 'Low Temperature']];
  var d = daily_data();
  num = parseInt(document.getElementById('num').innerHTML);
  for(var i=0;i<num;i++){
    date = new Date(parseInt(d[i].time, 10) * 1000);
    display = date.getDate()+' '+(get_month(date.getMonth()))+' '+date.getFullYear();
    var data_table_entry = [display, d[i].temperatureHigh, d[i].temperatureLow];
    data_table_array = data_table_array.concat([data_table_entry]);
  };
  return data_table_array;
}

function get_month(n){
  var month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
  return month[n];
}

function daily_data(){
  return window.weather_info.daily.data;
}

function openTab(evt, name) {
  if(name == 'tabular'){
    document.getElementById('bar_graph').style.display = 'none';
    document.getElementById('line_chart').style.display = 'none'; 
  }
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(name).style.display = "block";
  if(name == 'bar_graph'){
    document.getElementById('line_chart').style.display = "block";
  }
  evt.currentTarget.className += " active";
}

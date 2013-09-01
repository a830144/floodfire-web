<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    
<head>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
    <title>amCharts examples</title>
    <link rel="stylesheet" href="style.css" type="text/css">
    <script src="./js/amcharts.js" type="text/javascript"></script>         
    <script type="text/javascript">
            var chart;
            var chartData = [
            <%
               List list = (List)request.getAttribute("list");
               for (int i = 0; i < list.size(); i++) 
               {
	
	              out.print(list.get(i).toString().replace("-",""));
	              if(i < list.size()-1)
	              {
	                  out.print(",");
	              }
                } 
                out.print("];");
             %>                 
                             
                             
                          


            AmCharts.ready(function () {
                // SERIAL CHART  
                chart = new AmCharts.AmSerialChart();
                chart.pathToImages = "../amcharts/images/";
                chart.dataProvider = chartData;
                chart.categoryField = "date";
                chart.startDuration = 1;

                // AXES
                // category
                var categoryAxis = chart.categoryAxis;
                categoryAxis.gridPosition = "start";

                // value
                // in case you don't want to change default settings of value axis,
                // you don't need to create it, as one value axis is created automatically.
                
                // GRAPHS
                // column graph
                var graph1 = new AmCharts.AmGraph();
                graph1.type = "column";
                graph1.title = "推文人數";
                graph1.valueField = "user";
                graph1.lineAlpha = 0;
                graph1.fillAlphas = 1;
                chart.addGraph(graph1);

                // line
                var graph2 = new AmCharts.AmGraph();
                graph2.type = "line";
                graph2.title = "Tweet數";
                graph2.valueField = "tweet";
                graph2.lineThickness = 2;
                graph2.bullet = "round";
                chart.addGraph(graph2);

                // LEGEND                
                var legend = new AmCharts.AmLegend();
                chart.addLegend(legend);

                // WRITE
                chart.write("chartdiv");
            });
        </script>
    </head>
    
    <body>
        <div id="chartdiv" style="width:600px; height:400px;"></div>
    </body>

</html>
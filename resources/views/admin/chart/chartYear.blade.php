<!-- /.box-header -->
<div class="box-body">
  <div class="row">
    <!-- /.col -->
    <canvas id="chartjs-1" width="600" height="150"></canvas>
    <!-- /.col -->
  </div>
  <!-- /.row -->
</div>
  <script src="{{ asset('vendor/chartjs/dist/Chart.bundle.min.js') }}"></script>
<script>
function format_number(n) {
    return n.toFixed(0).replace(/./g, function(c, i, a) {
        return i > 0 && c !== "." && (a.length - i) % 3 === 0 ? "," + c : c;
    });
}
$(document).ready(function($) {
var ctx = document.getElementById('chartjs-1').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'bar',

    // The data for our dataset
    data: {
        "labels":{!! $months1 !!},
        "datasets":[
            {
                "label":"Total amount",
                "data":{!! $arrTotalsAmount_year !!},
                "fill":false,
                "backgroundColor":[
                "rgba(191, 25, 232, 0.2)",
                "rgba(191, 25, 232, 0.2)",
                "rgba(191, 25, 232, 0.2)",
                "rgba(191, 25, 232, 0.2)",
                "rgba(255, 99, 132, 0.2)",
                "rgba(255, 159, 64, 0.2)",
                "rgba(255, 205, 86, 0.2)",
                "rgba(75, 192, 192, 0.2)",
                "rgba(54, 162, 235, 0.2)",
                "rgba(153, 102, 255, 0.2)",
                "rgba(201, 203, 207, 0.2)",
                "rgba(181, 147, 50, 0.2)",
                "rgba(232, 130, 81, 0.2)",
                ],
                "borderColor":[
                "rgb(191, 25, 232)",
                "rgb(191, 25, 232)",
                "rgb(191, 25, 232)",
                "rgb(191, 25, 232)",
                "rgb(255, 99, 132)",
                "rgb(255, 159, 64)",
                "rgb(255, 205, 86)",
                "rgb(75, 192, 192)",
                "rgb(54, 162, 235)",
                "rgb(153, 102, 255)",
                "rgb(201, 203, 207)",
                "rgb(181, 147, 50)",
                "rgb(232, 130, 81)",
                ],
                "borderWidth":1,
                type:"bar",
            },
            {
                "label":"Line total amount",
                "data":{!! $arrTotalsAmount_year !!},
                "fill":false,
                "backgroundColor":"red",
                "borderColor":"red",
                "borderWidth":1,
                type:"line",
            }
        ]
    },
    options: {
        responsive: true,
        legend: {
          display: true,
        },
        layout: {
            padding: {
                left: 10,
                right: 10,
                top: 0,
                bottom: 0
            }
        },

        tooltips: {
            callbacks: {
                label: function(tooltipItem, data) {
                    var label = data.datasets[tooltipItem.datasetIndex].label || '';

                    if (label) {
                        label += ': ';
                    }
                    label += format_number(tooltipItem.yLabel);
                    return label;
                }
            }
        },
        scales: {
            yAxes: [
            {
              position: "left",
              // id: "y-axis-amount",
              ticks: {
                    beginAtZero:true,
                    callback: function(label, index, labels) {
                        return format_number(label);
                    },
                },
                scaleLabel: {
                     display: true,
                     labelString: 'Bit',
                     fontSize: 15
                  }
            }
            ]
        },
    },

});
});
</script>

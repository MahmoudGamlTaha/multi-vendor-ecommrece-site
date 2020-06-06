<div class="box-body">
<div class="row">
<!-- /.col -->
<canvas id="chart-days-in-month" width="700" height="200"></canvas>
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
var ctx = document.getElementById('chart-days-in-month').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'bar',

    // The data for our dataset
    data: {
        // type: 'category',
        labels: {!! $arrDays !!},
        datasets: [


        {
            label: "Total amount",
            backgroundColor: 'rgba(225,0,0,0.4)',
            borderColor: "rgb(231, 53, 253)",
            borderCapStyle: 'square',
            pointHoverRadius: 8,
            pointHoverBackgroundColor: "yellow",
            pointHoverBorderColor: "brown",
            data: {!! $arrTotalsAmount !!},
            showLine: true, // disable for a single dataset,
            yAxisID: "y-axis-gravity",
            fill: false,
            type: 'line',
            lineTension: 0.1,
        },
        {
            label: "Total order",
            backgroundColor: 'rgb(138, 199, 214)',
            borderColor: 'rgb(138, 199, 214)',
            pointHoverRadius: 8,
            pointHoverBackgroundColor: "brown",
            pointHoverBorderColor: "yellow",
            data: {!! $arrTotalsOrder !!},
            showLine: true, // disable for a single dataset,
            yAxisID: "y-axis-density",
            spanGaps: true,
            lineTension: 0.1,

        },

        ]
    },

    // Configuration options go here
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
        scales: {
            yAxes: [
            {
              position: "left",
              id: "y-axis-density",
                ticks: {
                    beginAtZero:true,
                    max: {!! $max_order  !!} + 5,
                    min: 0,
                    stepSize: 2,
                },
                  scaleLabel: {
                     display: true,
                     labelString: 'Total order',
                     fontSize: 15,

                  }
            },
            {
              position: "right",
              id: "y-axis-gravity",
              ticks: {
                    beginAtZero:true,
                    callback: function(label, index, labels) {
                        return format_number(label);
                    },
                },
                scaleLabel: {
                     display: true,
                     labelString: 'Total amount (Bit)',
                     fontSize: 15
                  }
            }
            ]
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
        }
    }
});
});
</script>

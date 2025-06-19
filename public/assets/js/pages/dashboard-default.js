'use strict';
document.addEventListener('DOMContentLoaded', function () {
  setTimeout(function () {
    floatchart();
  }, 500);
});

function floatchart() {
  (function () {
    // Lấy dữ liệu từ attribute Blade
    const weeklyEl = document.querySelector('#visitor-chart');
    const monthlyEl = document.querySelector('#visitor-chart-1');

    const weeklyData = JSON.parse(weeklyEl.dataset.weekVisitors || '{}');
    const monthlyData = JSON.parse(monthlyEl.dataset.monthVisitors || '{}');

    // Weekly Chart
    const weeklyOptions = {
      chart: {
        height: 450,
        type: 'area',
        toolbar: { show: false }
      },
      dataLabels: { enabled: false },
      colors: ['#1890ff', '#13c2c2'],
      series: [
        { name: 'Lượt xem trang', data: weeklyData.pageViews },
        { name: 'Sessions', data: weeklyData.sessions }
      ],
      stroke: { curve: 'smooth', width: 2 },
      xaxis: {
        categories: ['Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7', 'Chủ nhật']
      },
      tooltip: {
        y: {
          formatter: (val) => val.toLocaleString('vi-VN')
        }
      }
    };
    new ApexCharts(weeklyEl, weeklyOptions).render();

    // Monthly Chart
    const monthlyOptions = {
      chart: {
        height: 450,
        type: 'area',
        toolbar: { show: false }
      },
      dataLabels: { enabled: false },
      colors: ['#1890ff', '#13c2c2'],
      series: [
        { name: 'Lượt xem trang', data: monthlyData.pageViews },
        { name: 'Sessions', data: monthlyData.sessions }
      ],
      stroke: { curve: 'smooth', width: 2 },
      xaxis: {
        categories: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12']
      },
      tooltip: {
        y: {
          formatter: (val) => val.toLocaleString('vi-VN')
        }
      }
    };
    new ApexCharts(monthlyEl, monthlyOptions).render();
  })();


  (function () {
    const chartEl = document.querySelector('#income-overview-chart');
    if (!chartEl) return;

    const weeklyIncome = JSON.parse(chartEl.dataset.weeklyIncome || '[]');

    const formatCurrency = (value) => {
      return new Intl.NumberFormat('vi-VN').format(value) + ' đ';
    };

    var options = {
      chart: {
        type: 'bar',
        height: 365,
        toolbar: {
          show: false
        }
      },
      colors: ['#13c2c2'],
      plotOptions: {
        bar: {
          columnWidth: '45%',
          borderRadius: 4
        }
      },
      dataLabels: {
        enabled: false
      },
      series: [{
        name: "Doanh thu",
        data: weeklyIncome
      }],
      stroke: {
        curve: 'smooth',
        width: 2
      },
      xaxis: {
        categories: ['Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7', 'Chủ nhật'],
        axisBorder: {
          show: false
        },
        axisTicks: {
          show: false
        }
      },
      yaxis: {
        show: false
      },
      tooltip: {
        y: {
          formatter: formatCurrency
        }
      },
      grid: {
        show: false
      }
    };
    var chart = new ApexCharts(chartEl, options);
    chart.render();
  })();


  // (function () {
  //   var options = {
  //     chart: {
  //       type: 'line',
  //       height: 340,
  //       toolbar: {
  //         show: false
  //       }
  //     },
  //     colors: ['#faad14'],
  //     plotOptions: {
  //       bar: {
  //         columnWidth: '45%',
  //         borderRadius: 4
  //       }
  //     },
  //     stroke: {
  //       curve: 'smooth',
  //       width: 1.5
  //     },
  //     grid: {
  //       strokeDashArray: 4
  //     },
  //     series: [{
  //       data: [58, 90, 38, 83, 63, 75, 35, 55]
  //     }],
  //     xaxis: {
  //       type: 'datetime',
  //       categories: [
  //         '2018-05-19T00:00:00.000Z',
  //         '2018-06-19T00:00:00.000Z',
  //         '2018-07-19T01:30:00.000Z',
  //         '2018-08-19T02:30:00.000Z',
  //         '2018-09-19T03:30:00.000Z',
  //         '2018-10-19T04:30:00.000Z',
  //         '2018-11-19T05:30:00.000Z',
  //         '2018-12-19T06:30:00.000Z'
  //       ],
  //       labels: {
  //         format: 'MMM'
  //       },
  //       axisBorder: {
  //         show: false
  //       },
  //       axisTicks: {
  //         show: false
  //       }
  //     },
  //     yaxis: {
  //       show: false
  //     },
  //   };
  //   var chart = new ApexCharts(document.querySelector('#analytics-report-chart'), options);
  //   chart.render();
  // })();
  (function () {
    var options = {
      chart: {
        type: 'bar',
        height: 430,
        toolbar: {
          show: false
        }
      },
      plotOptions: {
        bar: {
          columnWidth: '30%',
          borderRadius: 4
        }
      },
      stroke: {
        show: true,
        width: 8,
        colors: ['transparent']
      },
      dataLabels: {
        enabled: false
      },
      legend: {
        position: 'top',
        horizontalAlign: 'right',
        show: true,
        fontFamily: `'Public Sans', sans-serif`,
        offsetX: 10,
        offsetY: 10,
        labels: {
          useSeriesColors: false
        },
        markers: {
          width: 10,
          height: 10,
          radius: '50%',
          offsexX: 2,
          offsexY: 2
        },
        itemMargin: {
          horizontal: 15,
          vertical: 5
        }
      },
      colors: ['#faad14', '#1890ff'],
      series: [{
        name: 'Net Profit',
        data: [180, 90, 135, 114, 120, 145]
      }, {
        name: 'Revenue',
        data: [120, 45, 78, 150, 168, 99]
      }],
      xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']
      },
    }
    var chart = new ApexCharts(document.querySelector('#sales-report-chart'), options);
    chart.render();
  })();
}

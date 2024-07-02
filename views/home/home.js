/*TODO:Requerido para los graficos*/
function getChartColorsArray(t) {
    if (null !== document.getElementById(t)) {
      var t = document.getElementById(t).getAttribute("data-colors");
      return (t = JSON.parse(t)).map(function (t) {
        var e = t.replace(" ", "");
        if (-1 === e.indexOf(",")) {
          var a = getComputedStyle(document.documentElement).getPropertyValue(
            e
          );
          return a || e;
        }
        t = t.split(",");
        return 2 != t.length
          ? e
          : "rgba(" +
              getComputedStyle(document.documentElement).getPropertyValue(
                t[0]
              ) +
              "," +
              t[1] +
              ")";
      });
    }
  }

$(document).ready(function () {


  /*TODO:listar asignaciones*/
  $.post(
    "../../controllers/HomeController.php?endpoint=get_asignaciones_x_taller_dona",
    { true: true },
    function (data) {
      console.log(data);
      data = JSON.parse(data);

      var taller = [];
      var total = [];

      var Mydata = data.map((item) => {
        taller.push(item.T_Nombre);
        total.push(item.TotalAsignaciones);
        return {
          value: item.TotalAsignaciones,
          name: item.T_Nombre,
        };
      });

      var chartPieColors = getChartColorsArray("chart-pie2");

      chartPieColors &&
        ((chartDom = document.getElementById("chart-pie2")),
        (myChart = echarts.init(chartDom)),
        (option = {
          tooltip: { trigger: "item" },
          legend: {
            orient: "vertical",
            left: "left",
            textStyle: { color: "#858d98" },
          },
          color: chartPieColors,
          series: [
            {
              name: "Access From",
              type: "pie",
              radius: "50%",
              data: Mydata,
              emphasis: {
                itemStyle: {
                  shadowBlur: 10,
                  shadowOffsetX: 0,
                  shadowColor: "rgba(0, 0, 0, 0.5)",
                },
              },
            },
          ],
          textStyle: { fontFamily: "Poppins, sans-serif" },
        }) && myChart.setOption(option));
    }
  );

  /*TODO:listar asignaciones*/
  $.post(
    "../../controllers/HomeController.php?endpoint=get_usuarios_xtaller_dona",
    { true: true },
    function (data) {
      console.log(data);
      data = JSON.parse(data);

      var nombre = [];
      var total = [];

      var Mydata = data.map((item) => {
        nombre.push(item.Nombres);
        total.push(item.Total);
        return {
          value: item.Total,
          name: item.Nombres,
        };
      });

      var chartDoughnutColors = getChartColorsArray("chart-doughnut1");
      chartDoughnutColors &&
        ((chartDom = document.getElementById("chart-doughnut1")),
        (myChart = echarts.init(chartDom)),
        (option = {
          tooltip: { trigger: "item" },
          legend: {
            top: "5%",
            left: "center",
            textStyle: { color: "#858d98" },
          },
          color: chartDoughnutColors,
          series: [
            {
              name: "Access From",
              type: "pie",
              radius: ["40%", "70%"],
              avoidLabelOverlap: !1,
              label: { show: !1, position: "center" },
              emphasis: {
                label: { show: !0, fontSize: "16", fontWeight: "bold" },
              },
              labelLine: { show: !1 },
              data:Mydata,
            },
          ],
          textStyle: { fontFamily: "Poppins, sans-serif" },
        }) && myChart.setOption(option));

 
    }
  );
});



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../logic/chart_cubit/chart_cubit.dart';
import '../silverCharts/silver_charts.dart';

class GoldCharts extends StatefulWidget {
  const GoldCharts({Key? key}) : super(key: key);

  @override
  State<GoldCharts> createState() => _GoldChartsState();
}

class _GoldChartsState extends State<GoldCharts> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<ChartCubit>(context, listen: false).gChart();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color1.white,
        title: Text(
          'Data analysis',
          style: Style.textStyle22.copyWith(
              fontSize: (height / 34.3).floorToDouble(),
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color1.primaryColor,
            size: 28,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<ChartCubit, ChartState>(
        builder: (context, state) {
          if (state.status == ChartStatus.loading ||
              state.status == ChartStatus.initial) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color1.primaryColor,
              strokeWidth: 1,
            ));
          }
          if (BlocProvider.of<ChartCubit>(context).gpro == null) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color1.primaryColor,
              strokeWidth: 1,
            ));
          }
          var d = BlocProvider.of<ChartCubit>(context).gpro;
          print(d);
          return SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Yearly Growth in the trade property in top three location for this year",
                  style: TextStyle(
                      color: Color1.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                d["mostActiveCity"].isNotEmpty
                    ? Column(
                        children: [
                          SizedBox(
                            height: 500,
                            child: Column(
                              children: [
                                Builder(builder: (context) {
                                  var l = d["mostActiveCity"][0];
                                  print(l);
                                  var data = d['barChartData'];
                                  List<charts.Series<dynamic, String>> series =
                                      [
                                    charts.Series(
                                        id: "developers",
                                        data: [
                                          SalesData(
                                            year: data[0]["month"],
                                            sales: data[0]["area1"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[1]["month"],
                                            sales: data[1]["area1"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[2]["month"],
                                            sales: data[2]["area1"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[3]["month"],
                                            sales: data[3]["area1"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[4]["month"],
                                            sales: data[4]["area1"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[5]["month"],
                                            sales: data[5]["area1"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[6]["month"],
                                            sales: data[6]["area1"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[7]["month"],
                                            sales: data[7]["area1"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[8]["month"],
                                            sales: data[8]["area1"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[9]["month"],
                                            sales: data[9]["area1"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[10]["month"],
                                            sales: data[10]["area1"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[11]["month"],
                                            sales: data[11]["area1"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                        ],
                                        domainFn: (series, _) => series.year,
                                        measureFn: (series, _) => series.sales,
                                        colorFn: (series, _) =>
                                            charts.ColorUtil.fromDartColor(
                                                Colors.green))
                                  ];
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 450,
                                        child: charts.BarChart(
                                          series,
                                          animate: true,
                                          animationDuration:
                                              const Duration(seconds: 5),
                                        ),
                                      ),
                                      Text(
                                        l,
                                        style: const TextStyle(
                                            color: Color1.primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 500,
                            child: Column(
                              children: [
                                Builder(builder: (context) {
                                  var l = d["mostActiveCity"][1];
                                  print(l);
                                  var data = d['barChartData'];
                                  List<charts.Series<dynamic, String>> series =
                                      [
                                    charts.Series(
                                        id: "developers",
                                        data: [
                                          SalesData(
                                            year: data[0]["month"],
                                            sales: data[0]["area2"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[1]["month"],
                                            sales: data[1]["area2"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[2]["month"],
                                            sales: data[2]["area2"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[3]["month"],
                                            sales: data[3]["area2"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[4]["month"],
                                            sales: data[4]["area2"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[5]["month"],
                                            sales: data[5]["area2"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[6]["month"],
                                            sales: data[6]["area2"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[7]["month"],
                                            sales: data[7]["area2"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[8]["month"],
                                            sales: data[8]["area2"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[9]["month"],
                                            sales: data[9]["area2"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[10]["month"],
                                            sales: data[10]["area2"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[11]["month"],
                                            sales: data[11]["area2"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                        ],
                                        domainFn: (series, _) => series.year,
                                        measureFn: (series, _) => series.sales,
                                        colorFn: (series, _) =>
                                            charts.ColorUtil.fromDartColor(
                                                Colors.green))
                                  ];
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 450,
                                        child: charts.BarChart(
                                          series,
                                          animate: true,
                                          animationDuration:
                                              const Duration(seconds: 5),
                                        ),
                                      ),
                                      Text(
                                        l,
                                        style: const TextStyle(
                                            color: Color1.primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 500,
                            child: Column(
                              children: [
                                Builder(builder: (context) {
                                  var l = d["mostActiveCity"][2];
                                  print(l);
                                  var data = d['barChartData'];
                                  List<charts.Series<dynamic, String>> series =
                                      [
                                    charts.Series(
                                        id: "developers",
                                        data: [
                                          SalesData(
                                            year: data[0]["month"],
                                            sales: data[0]["area3"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[1]["month"],
                                            sales: data[1]["area3"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[2]["month"],
                                            sales: data[2]["area3"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[3]["month"],
                                            sales: data[3]["area3"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[4]["month"],
                                            sales: data[4]["area3"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[5]["month"],
                                            sales: data[5]["area3"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[6]["month"],
                                            sales: data[6]["area3"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[7]["month"],
                                            sales: data[7]["area3"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[8]["month"],
                                            sales: data[8]["area3"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[9]["month"],
                                            sales: data[9]["area3"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[10]["month"],
                                            sales: data[10]["area3"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                          SalesData(
                                            year: data[11]["month"],
                                            sales: data[11]["area3"],
                                            barColor:
                                                charts.ColorUtil.fromDartColor(
                                                    Colors.green),
                                          ),
                                        ],
                                        domainFn: (series, _) => series.year,
                                        measureFn: (series, _) => series.sales,
                                        colorFn: (series, _) =>
                                            charts.ColorUtil.fromDartColor(
                                                Colors.green))
                                  ];
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 450,
                                        child: charts.BarChart(
                                          series,
                                          animate: true,
                                          animationDuration:
                                              const Duration(seconds: 5),
                                        ),
                                      ),
                                      Text(
                                        l,
                                        style: const TextStyle(
                                            color: Color1.primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Column(
                      children: [
                        const SizedBox(height: 350,),
                        Container(
                  alignment: Alignment.center,
                            child: const Text(
                              "thier isn\t any location",
                              style: TextStyle(
                                  color: Color1.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                      ],
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}

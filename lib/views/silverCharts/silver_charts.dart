import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/logic/chart_cubit/chart_cubit.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';

class SilverCharts extends StatefulWidget {
  const SilverCharts({Key? key}) : super(key: key);

  @override
  State<SilverCharts> createState() => _SilverChartsState();
}

class _SilverChartsState extends State<SilverCharts> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<ChartCubit>(context, listen: false).sChart();
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
          if (BlocProvider.of<ChartCubit>(context).spro == null) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color1.primaryColor,
              strokeWidth: 1,
            ));
          }
          var d = BlocProvider.of<ChartCubit>(context).spro;

          return SingleChildScrollView(
            child: Column(
              children: [
                Builder(
                  builder: (context) {
                    List data = d[0]['data'];
                    List<charts.Series<dynamic, String>> series = [
                      charts.Series(
                          id: "developers",
                          data: [
                            SalesData(
                              year: data[0]['x'],
                              sales: data[0]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[1]['x'],
                              sales: data[1]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[2]['x'],
                              sales: data[2]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[3]['x'],
                              sales: data[3]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[4]['x'],
                              sales: data[4]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[5]['x'],
                              sales: data[5]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[6]['x'],
                              sales: data[6]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[7]['x'],
                              sales: data[7]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[8]['x'],
                              sales: data[8]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[9]['x'],
                              sales: data[9]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[10]['x'],
                              sales: data[10]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[11]['x'],
                              sales: data[11]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                          ],
                          domainFn: (series, _) => series.year,
                          measureFn: (series, _) => series.sales,
                          colorFn: (series, _) =>
                              charts.ColorUtil.fromDartColor(Colors.green))
                    ];
                    return SizedBox(
                      height: 500,
                      child: Column(
                        children: [
                          Text(
                            "Yearly Growth in the ${d[0]['id']} property",
                            style: const TextStyle(
                                color: Color1.primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          Expanded(
                            child: charts.BarChart(
                              series,
                              animate: true,
                              animationDuration: const Duration(seconds: 5),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                ),
                Builder(
                  builder: (context) {
                    List data = d[1]['data'];
                    List<charts.Series<dynamic, String>> series = [
                      charts.Series(
                          id: "developers",
                          data: [
                            SalesData(
                              year: data[0]['x'],
                              sales: data[0]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[1]['x'],
                              sales: data[1]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[2]['x'],
                              sales: data[2]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[3]['x'],
                              sales: data[3]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[4]['x'],
                              sales: data[4]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[5]['x'],
                              sales: data[5]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[6]['x'],
                              sales: data[6]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[7]['x'],
                              sales: data[7]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[8]['x'],
                              sales: data[8]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[9]['x'],
                              sales: data[9]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[10]['x'],
                              sales: data[10]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                            SalesData(
                              year: data[11]['x'],
                              sales: data[11]['y'],
                              barColor: charts.ColorUtil.fromDartColor(Colors.green),
                            ),
                          ],
                          domainFn: (series, _) => series.year,
                          measureFn: (series, _) => series.sales,
                          colorFn: (series, _) =>
                              charts.ColorUtil.fromDartColor(Colors.green))
                    ];
                    return SizedBox(
                      height: 500,
                      child: Column(
                        children: [
                          Text(
                            "Yearly Growth in the ${d[1]['id']} property",
                            style: const TextStyle(
                                color: Color1.primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          Expanded(
                            child: charts.BarChart(
                              series,
                              animate: true,
                              animationDuration: const Duration(seconds: 5),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SalesData {
  SalesData({required this.year, required this.sales, required this.barColor});

  final String year;
  final int sales;
  final charts.Color barColor;
}

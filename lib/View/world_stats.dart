import 'package:covid_tracker_app/Model/WorldStatsModel.dart';
import 'package:covid_tracker_app/Services/stats_services.dart';
import 'package:covid_tracker_app/View/re_use_able_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import 'countries_list.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatsScreen> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStatsScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final _colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              FutureBuilder(
                  future: statsServices.fetchWorldStatsRecords(),
                  builder: (context, AsyncSnapshot<WorldStatsModel> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                          flex: 1,
                          child: SpinKitFadingCircle(
                            color: Colors.white,
                            controller: _controller,
                            size: 50.0,
                          ));
                    } else {
                      return Column(
                        children: [
                          PieChart(
                            centerTextStyle:
                                const TextStyle(color: Color(0xffffffff)),
                            dataMap: {
                              "Total": double.parse(
                                  snapshot.data!.cases!.toString()),
                              "Recovered": double.parse(
                                  snapshot.data!.recovered!.toString()),
                              "Deaths": double.parse(
                                  snapshot.data!.deaths!.toString()),
                            },
                            animationDuration:
                                const Duration(milliseconds: 1200),
                            chartType: ChartType.ring,
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.5,
                            colorList: _colorList,
                            chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true),
                            legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.06),
                            child: Card(
                              color: Colors.grey.shade700,
                              child: Column(
                                children: [
                                  ReUseAbleRow(
                                      title: "Total Cases",
                                      value: snapshot.data!.cases!.toString()),
                                  ReUseAbleRow(
                                      title: "Recovered",
                                      value:
                                          snapshot.data!.recovered!.toString()),
                                  ReUseAbleRow(
                                      title: "Total Deaths",
                                      value: snapshot.data!.deaths!.toString()),
                                  ReUseAbleRow(
                                      title: "Active Cases",
                                      value: snapshot.data!.active!.toString()),
                                  ReUseAbleRow(
                                      title: "Critical Cases",
                                      value:
                                          snapshot.data!.critical!.toString()),
                                  ReUseAbleRow(
                                      title: "Today Cases",
                                      value: snapshot.data!.todayCases!
                                          .toString()),
                                  ReUseAbleRow(
                                      title: "Today Recovered",
                                      value: snapshot.data!.todayRecovered!
                                          .toString()),
                                  ReUseAbleRow(
                                      title: "Today Deaths",
                                      value: snapshot.data!.todayDeaths!
                                          .toString()),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CountriesListScreen()));
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xff1aa260),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(
                                  child: Text(
                                "Track Country",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                            ),
                          )
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

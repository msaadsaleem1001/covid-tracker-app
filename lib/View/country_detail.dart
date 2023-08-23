import 'package:covid_tracker_app/View/re_use_able_row.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CountryDetailScreen extends StatefulWidget {
  String name, img;
  int totalCases, recoveredCases, deaths, activeCases, criticalCases, todayCases, todayDeaths;
  CountryDetailScreen({super.key,
    required this.name,
    required this.img,
    required this.totalCases,
    required this.recoveredCases,
    required this.deaths,
    required this.activeCases,
    required this.criticalCases,
    required this.todayCases,
    required this.todayDeaths

});

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                  child: Card(
                    color: Colors.grey.shade700,
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * .06),
                        ReUseAbleRow(
                          title: "Total Cases",
                          value: widget.totalCases.toString(),
                        ),
                        ReUseAbleRow(
                          title: "Recovered",
                          value: widget.recoveredCases.toString(),
                        ),
                        ReUseAbleRow(
                          title: "Total Deaths",
                          value: widget.deaths.toString(),
                        ),
                        ReUseAbleRow(
                          title: "Critical Cases",
                          value: widget.criticalCases.toString(),
                        ),
                        ReUseAbleRow(
                          title: "Today Cases",
                          value: widget.todayCases.toString(),
                        ),
                        ReUseAbleRow(
                          title: "Today Deaths",
                          value: widget.todayDeaths.toString(),
                        ),
                        ReUseAbleRow(
                          title: "Active",
                          value: widget.activeCases.toString(),
                        )
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.img),
                ),
              ],
            ),


        ],),
      ),
    );
  }
}

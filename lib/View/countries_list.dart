import 'package:covid_tracker_app/Services/stats_services.dart';
import 'package:covid_tracker_app/View/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries List"),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(child:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              onChanged: (value){
                setState(() {

                });
              },
              cursorColor: Colors.white,
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.white),
              controller: searchController,
              decoration: InputDecoration(
                focusColor: Colors.white,
                prefixIcon: const Icon(Icons.search_rounded,),
                prefixIconColor: Colors.white,
                hintStyle: const TextStyle(color: Colors.white),
                hintText: "Search with country name",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.white
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.white,),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),

            ),
          ),
          Expanded(
            flex: 1,
              child: FutureBuilder(
                  future: statsServices.fetchCountriesStatsRecords(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
                    if(!snapshot.hasData){
                      return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index){
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(height: 10, width: 100, color: Colors.white,),
                                    subtitle: Container(height: 10, width: 70, color: Colors.white,),
                                    leading: Container(height: 50, width: 50, color: Colors.white,),
                                  )
                                ],
                              ),
                            );
                          });
                    }
                    else{
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index){
                            String name = snapshot.data![index]['country'].toString();

                            if(searchController.text.isEmpty){
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>
                                          CountryDetailScreen(
                                              name: snapshot.data![index]['country'].toString(),
                                              img: snapshot.data![index]['countryInfo']['flag'].toString(),
                                              totalCases: snapshot.data![index]['cases'],
                                              recoveredCases: snapshot.data![index]['recovered'],
                                              deaths: snapshot.data![index]['deaths'],
                                              activeCases: snapshot.data![index]['active'],
                                              criticalCases: snapshot.data![index]['critical'],
                                              todayCases: snapshot.data![index]['todayCases'],
                                              todayDeaths: snapshot.data![index]['todayDeaths'],
                                          )));
                                },
                                child: ListTile(
                                  leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]['countryInfo']['flag'].toString())),
                                  title: Text(snapshot.data![index]['country'].toString()),
                                  subtitle: Text("Total cases : ${snapshot.data![index]['cases']}"),
                                ),
                              );
                            }
                            else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>
                                          CountryDetailScreen(
                                            name: snapshot.data![index]['country'].toString(),
                                            img: snapshot.data![index]['countryInfo']['flag'].toString(),
                                            totalCases: snapshot.data![index]['cases'],
                                            recoveredCases: snapshot.data![index]['recovered'],
                                            deaths: snapshot.data![index]['deaths'],
                                            activeCases: snapshot.data![index]['active'],
                                            criticalCases: snapshot.data![index]['critical'],
                                            todayCases: snapshot.data![index]['todayCases'],
                                            todayDeaths: snapshot.data![index]['todayDeaths'],
                                          )));
                                },
                                child: ListTile(
                                  leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]['countryInfo']['flag'].toString())),
                                  title: Text(snapshot.data![index]['country'].toString()),
                                  subtitle: Text("Total cases : ${snapshot.data![index]['cases']}"),
                                ),
                              );
                            }
                            else{
                              return Container();
                            }
                          });
                    }
                  }

              )
          ),

        ],
      )
      ),
    );
  }
}

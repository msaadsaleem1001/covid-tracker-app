import 'dart:convert';

import 'package:covid_tracker_app/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

import '../Model/WorldStatsModel.dart';

class StatsServices {

  Future<WorldStatsModel> fetchWorldStatsRecords () async{

    final response = await http.get(Uri.parse(AppUrl.worldStatsApi));

    if(response.statusCode == 200){

      var data = jsonDecode(response.body);
      return WorldStatsModel.fromJson(data);
    }
    else{

      throw Exception("Error");
    }

  }

  Future<List<dynamic>> fetchCountriesStatsRecords () async{
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if(response.statusCode == 200){

      data = jsonDecode(response.body);
      return data;
    }
    else{

      throw Exception("Error");
    }

  }
  
}
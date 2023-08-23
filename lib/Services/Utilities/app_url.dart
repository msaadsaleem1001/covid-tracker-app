

class AppUrl{

  // base url to fetch results from all over the world
  static const String baseUrl = 'https://disease.sh/v3/covid-19/';

  // Concatenate the key words with base url
  static const String worldStatsApi = '${baseUrl}all';
  static const String countriesList = '${baseUrl}countries';

}
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../constants/api_constants.dart';

// class NewsApiService {
//   final http.Client client;

//   NewsApiService({required this.client});

//   Future<dynamic> fetchEverything({Map<String, String>? queryParams}) async {
//     final uri = Uri.parse(
//       ApiConstants.baseUrl + ApiConstants.everythingEndpoint,
//     ).replace(
//       queryParameters: {...ApiConstants.defaultParams, ...?queryParams},
//     );

//     try {
//       final response = await client.get(uri, headers: ApiConstants.headers);

//       if (response.statusCode == 200) {
//         return json.decode(response.body);
//       } else if (response.statusCode == 401) {
//         throw Exception('Unauthorized: Invalid API key');
//       } else {
//         throw Exception('Failed to load data: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to connect to the server: $e');
//     }
//   }

//   Future<dynamic> fetchTopHeadlines({Map<String, String>? queryParams}) async {
//     final uri = Uri.parse(
//       ApiConstants.baseUrl + ApiConstants.topHeadlinesEndpoint,
//     ).replace(
//       queryParameters: {...ApiConstants.defaultParams, ...?queryParams},
//     );

//     try {
//       final response = await client.get(uri, headers: ApiConstants.headers);

//       if (response.statusCode == 200) {
//         return json.decode(response.body);
//       } else if (response.statusCode == 401) {
//         throw Exception('Unauthorized: Invalid API key');
//       } else {
//         throw Exception('Failed to load data: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to connect to the server: $e');
//     }
//   }
// }

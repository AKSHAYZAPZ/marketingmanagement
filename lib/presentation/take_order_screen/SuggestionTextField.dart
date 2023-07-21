// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'ApiData.dart';
//
// class SuggestionTextField extends StatelessWidget {
//   final String backendAPIURL;
//   final String id;
//   String query = '';
//
//   SuggestionTextField({required this.backendAPIURL, required this.id});
//
//   Future<List<ApiData>> _getSuggestions(String query) async {
//     final  List<ApiData> allData = await fetchData();
//     return allData.where((data) {
//       return data.code.contains(query) || data.name.contains(query);
//     }).toList();
//   }
//
//   Future<List<ApiData>> fetchData() async {
//     final response = await http.post(Uri.parse(backendAPIURL),body: ({'token': id}));
//     // print('api ---------- $backendAPIURL');
//     // print('token ---------------- $id');
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       final List<dynamic> data= json.decode(response.body);
//       print(data);
//       return data.map((json) => ApiData.fromJson(json)).toList();
//     } else {
//       return []; // Return an empty list if something went wrong with the API call
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//   //   return TypeAheadField<String>(
//   //     textFieldConfiguration: TextFieldConfiguration(
//   //       decoration: InputDecoration(
//   //         hintText: 'Poductname or code',
//   //         enabledBorder: OutlineInputBorder(
//   //           borderSide: BorderSide(
//   //               color: Colors.transparent),
//   //         ),
//   //         focusedBorder: OutlineInputBorder(
//   //           borderSide: BorderSide(
//   //               color: Colors.transparent),
//   //         ),
//   //       ),
//   //     ),
//   //     suggestionsCallback: (pattern) async {
//   //       return await _getSuggestions(pattern);
//   //     },
//   //     itemBuilder: (context, suggestion) {
//   //       return ListTile(
//   //         title: Text(suggestion.name),
//   //         subtitle: Text(suggestion.code),
//   //       );
//   //     },
//   //     onSuggestionSelected: (suggestion) {
//   //       // Do something when a suggestion is selected
//   //       print('Selected: ${suggestion.name}, ${suggestion.code}');
//   //     },
//   //   );
//   // }
// }
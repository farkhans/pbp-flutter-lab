import '../models/my_watch_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<MyWatchList>> fetchMyWatchList() async {
  var url = Uri.parse('https://nama-proyek.herokuapp.com/mywatchlist/json/');

  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<MyWatchList> myWatchList = [];

  for (var d in data) {
    if (d != null) {
      myWatchList.add(MyWatchList.fromJson(d));
    }
  }

  return myWatchList;
}

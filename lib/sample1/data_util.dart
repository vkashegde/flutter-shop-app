import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provydr/sample1/data_model.dart';

class DataUtil {
  Future<List<DataModel>> getData() async {
    List<DataModel> listData = [];
    try {
      // var request = http.Request(
      //     'GET', Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      // http.StreamedResponse response = await request.send();

      var abcd2 = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (abcd2.statusCode == 200) {
        //var rawData = await response.stream.bytesToString();
        List<dynamic> data = jsonDecode(abcd2.body);
        data.forEach((element) {
          DataModel model = DataModel.fromJson(element);
          listData.add(model);
        });
        return listData;
      } else {
        // print(response.reasonPhrase);
        return [];
      }
    } catch (e) {
      print("Exception in Data $e");
      throw e;
    }
  }
}

// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, avoid_print, unused_local_variable
import 'dart:convert';
import 'package:http/http.dart';
// import 'package:mytask3/AddList.dart';
import 'package:mytask3/DataLists.dart';

class ApiHelper {
 
  saveTask(DataList lists) async {
    var url = Uri.https("api.mohamed-sadek.com", "/Task/POST");
    var res = await post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, Object>{
          "Title": lists.title,
          "ID": lists.id.toString(),
          "IsDone": lists.isCreated,
          "CreatedDate": lists.date,
        }));
    var data = jsonDecode(res.body);
    print(data);
  }

  Future<List<DataList>> getallData() async {
    var url = Uri.https("api.mohamed-sadek.com", "/Task/Get");
    var res = await get(url);
    var data = jsonDecode(res.body)['Data'] as List;
    print(data);

    List<DataList> list = data
        .map((item) => DataList(
              id: item["ID"],
              isCreated: item["IsDone"],
              date: item['CreatedDate'],
              title: item["Title"],
            ))
        .toList();
    return list;
  }

  Future<bool> deleteList(int id) async {
    print(id);
    var url = Uri.https(
        "api.mohamed-sadek.com", "/Task/Delete", {'id': id.toString()});
    var res = await delete(url);

    print(res.statusCode);
    print(res.body);

    return jsonDecode(res.body)["Success"] as bool;
  }
}

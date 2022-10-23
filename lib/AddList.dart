// ignore_for_file: unnecessary_import, implementation_imports, unused_import, prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'DataLists.dart';
import 'ApiHelper.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  var selectedValue = '1';

  var form = GlobalKey<FormState>();
  var dataList = DataList(id: 0, title: "", isCreated: false, date: "");
  var api = ApiHelper();
  saveForm() async {
    if (form.currentState!.validate()) {
      print("save");
      form.currentState?.save();
      await api.saveTask(dataList);

      print(dataList.id);
      print(dataList.title);
      print(dataList.isCreated);
      print(dataList.date);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
            'Reset List',
            textAlign: TextAlign.justify,
          ),
          IconButton(
              onPressed: () {
                form.currentState?.reset();
              },
              icon: Icon(Icons.delete)),
        ],
        backgroundColor: Colors.teal,
        title: Text('Add New List'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: form,
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: Text('Enter List ID'),
                    icon: Icon(Icons.numbers_outlined)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "ID is required";
                  }
                  if (value.length > 4) {
                    return "ID should be maximum 3 Digits";
                  }
                  return null;
                },
                onSaved: ((newValue) {
                  setState(() {
                    dataList.id = int.parse(newValue!);
                  });
                }),
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    label: Text('Enter List Title'),
                    icon: Icon(Icons.abc_rounded)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "ListName is required";
                  }
                  if (value.length > 12) {
                    return "ListName should be maximum 12 Digits";
                  }
                  if (value.length < 3) {
                    return "ListName should be minimum 3 Digits";
                  }
                  return null;
                },
                onSaved: ((newValue) {
                  setState(() {
                    dataList.title = newValue!;
                  });
                }),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: Text('Enter Created Date'),
                    icon: Icon(Icons.date_range)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Created Date is required";
                  }
                  return null;
                },
                onSaved: ((newValue) {
                  setState(() {
                    dataList.date = newValue!;
                  });
                }),
              ),
              OutlinedButton(onPressed: saveForm, child: Text('SAVE'))
            ],
          ),
        ),
      ),
    );
  }
}

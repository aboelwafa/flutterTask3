// ignore_for_file: implementation_imports, unused_import, prefer_const_constructors

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScrren extends StatelessWidget {
  const HomeScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeList'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/list');
          },
          child: Icon(Icons.comment)),
    );
  }
}

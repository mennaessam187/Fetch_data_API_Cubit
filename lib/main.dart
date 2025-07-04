import 'package:fetch_data_api/Block/post_Block.dart';
import 'package:fetch_data_api/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => postBlock(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: homePage(),
      ),
    );
  }
}

import 'package:fetch_data_api/cubit/post_cubit.dart';
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
      create: (context) => postCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: homePage(),
      ),
    );
  }
}

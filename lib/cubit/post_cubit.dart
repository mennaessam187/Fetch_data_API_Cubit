import 'dart:convert';

import 'package:fetch_data_api/cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class postCubit extends Cubit<postState> {
  //initial state
  postCubit() : super(postLoading());
  Future fetchData() async {
    try {
      // emit(postLoading());
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {
          'Accept': 'application/json',
          'User-Agent': 'FlutterApp',
        },
      );
      //data fetch
      print("Fetching data...");
      print("Status code: ${response.statusCode}");

      if (response.statusCode == 200) {
        final List post = json.decode(response.body);
        emit(postLoaded(post: post));
      }
    } catch (e) {
      emit(postError(message: "$e"));
    }
  }
}

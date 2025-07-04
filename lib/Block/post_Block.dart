import 'dart:convert';
import 'package:fetch_data_api/Block/post_event.dart';
import 'package:fetch_data_api/Block/post_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class postBlock extends Bloc<postEvent, postState> {
  postBlock() : super(postLoading()) {
    on<fetchData>((event, emit) async {
      emit(postLoading());
      try {
        final response = await http.get(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          headers: {
            'Accept': 'application/json',
            'User-Agent': 'FlutterApp',
          },
        );
        if (response.statusCode == 200) {
          final List post = json.decode(response.body);
          emit(postLoaded(Post: post));
        }
      } catch (e) {
        emit(postError(message: "$e"));
        Text("$e");
      }
    });
  }
}

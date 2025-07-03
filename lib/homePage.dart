import 'package:fetch_data_api/cubit/post_cubit.dart';
import 'package:fetch_data_api/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  void initState() {
    //context.read<postCubit>().fetchData();
    super.initState();
    Future.microtask(() => context.read<postCubit>().fetchData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mastering"),
      ),
      body: BlocBuilder<postCubit, postState>(
        builder: (context, state) {
          if (state is postLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is postLoaded) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: state.post.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${state.post[index]["title"]}"),
                  subtitle: Text("${state.post[index]["body"]}"),
                  leading: Text("${state.post[index]["id"]}"),
                  trailing: Text("${state.post[index]["userId"]}"),
                );
              },
            );
          } else if (state is postError) {
            return Text("${state.message}");
          }
          return Center(child: Text("No data"));
        },
      ),
    );
  }
}

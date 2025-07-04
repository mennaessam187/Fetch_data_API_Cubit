import 'package:fetch_data_api/Block/post_Block.dart';
import 'package:fetch_data_api/Block/post_event.dart';
import 'package:fetch_data_api/Block/post_state.dart';
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
    Future.microtask(() => context.read<postBlock>().add(fetchData()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Master In State Management using(Bloc)"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(),
          child: BlocBuilder<postBlock, postState>(
            builder: (context, state) {
              if (state is postLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is postLoaded) {
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 2,
                    );
                  },
                  itemCount: state.Post.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${state.Post[index]["title"]}"),
                      subtitle: Text("${state.Post[index]["body"]}"),
                      leading: Text("${state.Post[index]["id"]}"),
                      trailing: Text("${state.Post[index]["userId"]}"),
                    );
                  },
                );
              } else if (state is postError) {
                return Text("${state.message}");
              }
              return Center(child: Text("No data"));
            },
          ),
        ),
      ),
    );
  }
}

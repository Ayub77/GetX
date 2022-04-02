// ignore_for_file: prefer_const_constructors
import 'package:bloc/model/post_model.dart';
import 'package:bloc/pages/update_and_newAdd_post.dart';
import 'package:bloc/viewmodel/home_view_model.dart';
import 'package:bloc/widgets/home+page_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final _controller = Get.put(HemeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
        centerTitle: true,
      ),
      body:Obx(
        ()=>Stack(
              children: [
                ListView.builder(
                    itemCount: _controller.items.length,
                    itemBuilder: (context, index) {
                      return HomeWidget(
                        scoped: _controller,
                        post: _controller.items[index],
                      );
                    }),
                _controller.loading()? Center(child: CircularProgressIndicator(),): SizedBox.shrink()
                    ],
            )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateAndAdd(title: "Add",id: "0"))).then((value) {
            if (value) {
              _controller.apiPostList();
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

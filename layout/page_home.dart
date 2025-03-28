import 'package:flutter/material.dart';
import 'package:helloworld_minhtri/Profile/page_profile.dart';
import 'package:helloworld_minhtri/layout/page_gridview.dart';

import '../app_state/getx/app_getx.dart';
import '../app_state/getx/getx_counter.dart';
import '../app_state/getx/getx_simple_state.dart';
import '../commercial_app/app_fruit_store.dart';
import '../commercial_app/page_fruit_stream.dart';
import '../getx_app/GetxMyApp.dart';
import '../json/page_albums.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("My App"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              buildButton(context,title: "My profile", destination: PageMyProfile()),
              buildButton(context,title: "My grid view", destination: PageGridview()),
              // buildButton(context,title: "My Page Counter GetX", destination: PageCounterGetX()),
              buildButton(context,title: "My Page Counter Simple", destination: PageCounterSimple()),
              buildButton(context,title: "My Getxmyapp", destination: GetxMyapp()),
              buildButton(context,title: "GetX App", destination: AppGetX()),
              buildButton(context,title: "My Page Albums", destination: PageAlbums()),
              buildButton(context,title: "My App Fruit Store", destination: AppFruitStore()),
              buildButton(context,title: "My App Fruit Stream", destination:  PageFruitStream()),
            ],
          ),
        ),  
      ),
    );

  }

  Container buildButton(BuildContext context,{required String title, required Widget destination}) {
    return Container(
      width: MediaQuery.of(context).size.width*2/3,
      child: ElevatedButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)
        => destination));
      },
          child: Text(title)
      ),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helloworld_minhtri/commercial_app/Page_chitiet_fruit.dart';
import 'package:helloworld_minhtri/commercial_app/controllers/controller_fruit_cntt3.dart';
import 'package:helloworld_minhtri/commercial_app/models/model.dart';
import 'package:badges/badges.dart' as badges;

class AppFruitStore extends StatelessWidget {
  const AppFruitStore({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Fruit Store 64CNTT",
      initialBinding: BindingsAppFruitStore(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: PageHomeFruitStore(),
    );
  }
}

class PageHomeFruitStore extends StatelessWidget {
  const PageHomeFruitStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruit Store 64CNTT"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          GetBuilder(
              id: 'gh',
              init: ControllerFruit.get(),
              builder: (controller) => badges.Badge(
                showBadge: controller.slMHGH>0,
                badgeContent: Text('${controller.slMHGH}',style: TextStyle(color: Colors.white),),
                child: Icon(Icons.shopping_cart, size: 30,),
              ),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: GetBuilder(
          id: "fruits",
          init: ControllerFruit.get(),
          builder: (controller) {
            var fruits = controller.fruits;
            return GridView.extent(
              maxCrossAxisExtent: 300,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 0.75,
              children: fruits.map(
                  (e) => GestureDetector(
                    onTap: () {
                      Get.to(PageChitietFruit(fruit: e));
                    },
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                              child: Image.network(e.anh??"Link mac dinh"),
                            ),
                        ),
                        Text(e.ten,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text("${e.gia?? 0} vnd",style: TextStyle(color: Colors.red),),

                      ],
                    ),
                  ),
              ).toList(),
            );
          },
      ),
    );
  }
}

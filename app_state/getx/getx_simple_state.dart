import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helloworld_minhtri/app_state/getx/getx_counter.dart';

class ControllerGetXSimple extends GetxController{
   var count=0;


   
   
   increment01(){
     count++;
     update(["01"],count <= 10);
   }
   
   increment02(){
     count++;
     update(["02"]);
   }
   
   incrementAll(){
     count++;
     update(["01","02"]);
   }



}


class PageCounterSimple extends StatefulWidget {
  PageCounterSimple({super.key});

  @override
  State<PageCounterSimple> createState() => _PageCounterSimpleState();
}

class _PageCounterSimpleState extends State<PageCounterSimple> {
  final controller = Get.put(ControllerGetXSimple());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Simple Counter"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder(
              id: "01",
              init: controller,
              builder: (controller) => Text("01: ${controller.count}",style: TextStyle(fontSize: 20),),
            ),
            GetBuilder<ControllerGetXSimple>(
              id: "02",
              builder: (controller) => Text("02: ${controller.count}",style: TextStyle(fontSize: 20),),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.increment01();
                },
                child: Text("Inc 01")
            ),ElevatedButton(
                onPressed: () {
                  controller.increment02();
                },
                child: Text("Inc 02")
            ),
            ElevatedButton(
                onPressed: () {
                  // controller.increment02();
                  setState(() {
                  });
                },
                child: Text("Call build method")
            ), ElevatedButton(
                onPressed: () {
                  controller.incrementAll();
                },
                child: Text("Inc All")
            )

          ],
        ),
      ),
    );
  }
}


// class PageCounterSimple extends StatelessWidget {
//   PageCounterSimple({super.key});
//   final controller = Get.put(ControllerGetXSimple());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Getx Simple Counter"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GetBuilder(
//                 id: "01",
//                 init: controller,
//                 builder: (controller) => Text("01: ${controller.count}",style: TextStyle(fontSize: 20),),
//             ),
//             GetBuilder<ControllerGetXSimple>(
//               id: "02",
//               builder: (controller) => Text("02: ${controller.count}",style: TextStyle(fontSize: 20),),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   controller.increment01();
//                 },
//                 child: Text("Inc 01")
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   controller.increment02();
//                   // setState(() {
//                   // });
//                 },
//                 child: Text("Call build method")
//             ), ElevatedButton(
//                 onPressed: () {
//                   controller.incrementAll();
//                 },
//                 child: Text("Inc All")
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
// }

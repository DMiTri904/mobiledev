

import 'package:get/get.dart';
import 'package:helloworld_minhtri/commercial_app/models/model.dart';

class ControllerFruit extends GetxController{
  var _map = <int, Fruit>{};
  var gh = <GH_item>[];

  int get slMHGH => gh.length;
  static ControllerFruit get()=> Get.find();
  Iterable<Fruit> get fruits => _map.values;
  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();
    _map= await FruitSnapshot.getMapFruit();
    update(["fruits"]);
    FruitSnapshot.listenChangeData(_map, updateUI: () =>
      update(["fruits"]),);
  }

  themMHGH(Fruit f){
    for(var item in gh){
      if(item.fruit.id == f.id){
        item.sl++;
        return;
      }
    }
    gh.add(GH_item(fruit: f, sl: 1));
    update(['gh']);

  }

  @override
  void onClose(){
    super.onClose();
    FruitSnapshot.unsubriceListenFruitChange();
  }



}

class BindingsAppFruitStore extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ControllerFruit(),);
  }
}

class GH_item{
  Fruit fruit;
  int sl;

  GH_item({required this.fruit, required this.sl});
}
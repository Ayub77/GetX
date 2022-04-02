import 'package:bloc/model/post_model.dart';
import 'package:bloc/services/http_service.dart';
import 'package:get/get.dart';

class HemeController extends GetxController{
  var loading = false.obs;
  var items =  <Post>[].obs ;

 Future apiPostList() async {
    loading(true); 

    var respons = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (respons != null) {
      items.value = Network.parsePostList(respons);
    } else {
      items.value = [];
    }
    loading(false);
    
  }

 Future<bool> apiPostdelete(Post post) async {
    loading(true);
    var respons = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    loading(false);
     return respons!=null;
  }
}

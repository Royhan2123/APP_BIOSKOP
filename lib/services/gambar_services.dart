import 'package:apk_bioskop/models/gambar_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GambarServices {
  List<String> gambar = [];
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("gambar");

  Future<List<GambarModels>> fetchGambar() async {
    try {
      QuerySnapshot querySnapshot = await collectionReference.get();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        gambar.add(querySnapshot.docs[i]["imageUrl"]["desc"]["name"]["price"]
            ["rating"]);
      
      }
      return fetchGambar();
    } catch (e) {
      throw e.toString();
    }
  }
}

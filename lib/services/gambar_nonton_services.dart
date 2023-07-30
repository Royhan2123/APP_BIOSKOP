import 'package:apk_bioskop/models/gambar_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GambarNontonServices {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("gambar_nonton");

  Future<List<GambarModels>> fetchGambarNonton() async {
    try {
      QuerySnapshot querySnapshot = await collectionReference.get();

      List<GambarModels> gambar = querySnapshot.docs.map((e) {
        return GambarModels.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return gambar;
    } catch (e) {
      throw e.toString();
    }
  }
}

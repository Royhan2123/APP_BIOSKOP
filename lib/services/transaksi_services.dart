import 'package:apk_bioskop/models/transaksi_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransaksiServices {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("transaksi");

  Future<void> dataTransaks(TransaksiModels transaksi) async {
    try {
      collectionReference.add(
        {
          'gambar' : transaksi.gambar.toJson(),
          'noTicket' : transaksi.noTicket,
          'pembelian' : transaksi.pembelian,
          'hargaKursi' : transaksi.hargaKursi,
          'biayaLayanan' : transaksi.biayaLayanan,
        }
      );
    } catch (e) {
      throw e.toString();
    }
  }

}

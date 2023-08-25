import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getSpends() async {
  List spends = [];
  CollectionReference collectionReferenceSpends = db.collection('spends');
  QuerySnapshot querySpends = await collectionReferenceSpends.get();

  querySpends.docs.forEach((documento) {
    spends.add(documento.data());
  });
  return spends;
}

Future<void> addSpends(String nombre, String descrip, double monto, String tipo,
    DateTime fecha) async {
  CollectionReference spendsCollection =
      FirebaseFirestore.instance.collection('spends');

  // Agrega los datos a la colección
  await spendsCollection.add({
    'nombre': nombre,
    'descrip': descrip,
    'monto': monto,
    'tipo': tipo,
    'fecha': fecha,
  });
}

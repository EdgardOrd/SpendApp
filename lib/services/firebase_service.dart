import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
final gastosCollectionReference =
    FirebaseFirestore.instance.collection('spends');

Future<List> getSpends() async {
  List spends = [];
  CollectionReference collectionReferenceSpends = db.collection('spends');
  QuerySnapshot querySpends = await collectionReferenceSpends.get();

  for (var documento in querySpends.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final registro = {
      "descrip": data['descrip'],
      "fecha": data['fecha'],
      "monto": data['monto'],
      "nombre": data['nombre'],
      "tipo": data["tipo"],
      "uid": documento.id
    };
    spends.add(registro);
  }
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

Future<void> updateSpends(String uid, String newDescrip, DateTime newFecha,
    double newMonto, String newNombre, String newTipo) async {
  await db.collection('spends').doc(uid).set({
    "descrip": newDescrip,
    "fecha": newFecha,
    "monto": newMonto,
    "nombre": newNombre,
    "tipo": newTipo
  });
}

Future<void> deleteSpends(String uid) async {
  await db.collection("spends").doc(uid).delete();
}

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addEtudiantDetails(
      Map<String, dynamic> etudiantInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Etudiant") // Cohérence dans les noms de collections.
        .doc(id)
        .set(etudiantInfoMap);
  }

  Future<Stream<QuerySnapshot>> getEtudiantDetail() async {
    return FirebaseFirestore.instance.collection("Etudiant").snapshots();
  }

  Future updateEtudiantDetail(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("Etudiant")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteEtudiantDetail(String id) async {
    return await FirebaseFirestore.instance
        .collection("Etudiant")
        .doc(id)
        .delete(); // Ajout de la méthode delete().
  }
}

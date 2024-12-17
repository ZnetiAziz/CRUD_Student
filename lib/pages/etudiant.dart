import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class Etudiant extends StatefulWidget {
  const Etudiant({super.key});

  @override
  State<Etudiant> createState() => _EtudiantState();
}

class _EtudiantState extends State<Etudiant> {
  TextEditingController nomcontroller = TextEditingController();
  TextEditingController prenomcontroller = TextEditingController();
  TextEditingController departementcontroller = TextEditingController();
  TextEditingController groupecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " Ajouter un Étudiant",
              style: TextStyle(
                  color: Color.fromARGB(255, 45, 13, 250),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Champ de saisie Nom
              _buildInputField("Nom", nomcontroller),
              // Champ de saisie Prénom
              _buildInputField("Prénom", prenomcontroller),
              // Champ de saisie Département
              _buildInputField("Département", departementcontroller),
              // Champ de saisie Groupe
              _buildInputField("Groupe", groupecontroller),
              SizedBox(height: 30.0),
              Center(
                child: ElevatedButton.icon(
                  onPressed: _addEtudiant,
                  icon: Icon(Icons.add),
                  label: Text(
                    "Ajouter",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Container(
          padding: EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  void _addEtudiant() async {
    if (nomcontroller.text.isEmpty ||
        prenomcontroller.text.isEmpty ||
        departementcontroller.text.isEmpty ||
        groupecontroller.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Tous les champs doivent être remplis",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    String Id = randomAlphaNumeric(10);
    Map<String, dynamic> etudiantInfoMap = {
      "nom": nomcontroller.text,
      "prenom": prenomcontroller.text,
      "departement": departementcontroller.text,
      "Id": Id,
      "groupe": groupecontroller.text,
    };

    try {
      await DatabaseMethods().addEtudiantDetails(etudiantInfoMap, Id);
      Fluttertoast.showToast(
          msg: "Étudiant ajouté avec succès",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      nomcontroller.clear();
      prenomcontroller.clear();
      departementcontroller.clear();
      groupecontroller.clear();
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Erreur lors de l'ajout : $e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

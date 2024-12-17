import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/etudiant.dart';
import 'package:flutter_application_1/services/database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController departementController = TextEditingController();
  TextEditingController groupeController = TextEditingController();
  Stream<QuerySnapshot>? etudiantStream;

  @override
  void initState() {
    super.initState();
    getOnLoad();
  }

  getOnLoad() async {
    etudiantStream = await DatabaseMethods().getEtudiantDetail();
    setState(() {});
  }

  Widget allEtudiantDetails() {
    return StreamBuilder<QuerySnapshot>(
      stream: etudiantStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              "Aucun étudiant trouvé",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data!.docs[index];
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nom: ${ds["nom"]}",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  nomController.text = ds["nom"];
                                  prenomController.text = ds["prenom"];
                                  departementController.text =
                                      ds["departement"];
                                  groupeController.text = ds["groupe"];
                                  editEtudiantDetail(ds.id);
                                },
                                child: Icon(Icons.edit, color: Colors.brown),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () async {
                                  await DatabaseMethods()
                                      .deleteEtudiantDetail(ds.id);
                                },
                                child: Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "Prénom: ${ds["prenom"]}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        "Département: ${ds["departement"]}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        "Groupe: ${ds["groupe"]}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future editEtudiantDetail(String id) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Modifier étudiant"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nomController,
                  decoration: InputDecoration(labelText: "Nom"),
                ),
                TextField(
                  controller: prenomController,
                  decoration: InputDecoration(labelText: "Prénom"),
                ),
                TextField(
                  controller: departementController,
                  decoration: InputDecoration(labelText: "Département"),
                ),
                TextField(
                  controller: groupeController,
                  decoration: InputDecoration(labelText: "Groupe"),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> updateInfo = {
                  "nom": nomController.text,
                  "prenom": prenomController.text,
                  "departement": departementController.text,
                  "groupe": groupeController.text,
                };
                await DatabaseMethods().updateEtudiantDetail(id, updateInfo);
                Navigator.pop(context);
              },
              child: Text("Mettre à jour"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Annuler"),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Etudiant()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Gestion des étudiants",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.update),
            onPressed: getOnLoad,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: allEtudiantDetails(),
      ),
    );
  }
}

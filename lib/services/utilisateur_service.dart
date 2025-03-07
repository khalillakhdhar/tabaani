import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/utilisateur_model.dart';

class UtilisateurService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // create utilisateur with utilisateur model
  Future createUtilisateur(UtilisateurModel utilisateur) async {
    try {
      // get utilisateur id from auth of current user
      User? user = _auth.currentUser;
      utilisateur.id = user!.uid;
      await _db
          .collection('utilisateurs')
          .doc(utilisateur.id)
          .set(utilisateur.toMap());
      return utilisateur;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // read utilisateur with id
  Future<UtilisateurModel?> readUtilisateur(String id) async {
    try {
      DocumentSnapshot doc = await _db.collection('utilisateurs').doc(id).get();
      return UtilisateurModel.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // get all utilisateur
  Future<List<UtilisateurModel>> getUtilisateurs() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection('utilisateurs').get();
      return querySnapshot.docs
          .map((doc) =>
              UtilisateurModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  // update utilisateur with utilisateur model
  Future updateUtilisateur(UtilisateurModel utilisateur) async {
    try {
      await _db
          .collection('utilisateurs')
          .doc(utilisateur.id)
          .update(utilisateur.toMap());
      return utilisateur;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // delete utilisateur with id
  Future deleteUtilisateur(String id) async {
    try {
      await _db.collection('utilisateurs').doc(id).delete();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}

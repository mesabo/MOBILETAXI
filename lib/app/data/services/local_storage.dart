import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/proprio_model.dart' as proprio;

class LocalStorage extends GetxController {
  final box = GetStorage();
  static const String tableName = "proprio_user_data";

  ///`READ USER DATA FROM LOCAL STORAGE AND RETURN`
  ///`IF NOT EMPTY ELSE CLEAR USER`
  Future<proprio.Objet> readUserData() async {
    var currentUser = proprio.Objet();
    if (box.read("proprio_user_data") != null) {
      print("READING CURRENT USER....}");
      final data = box.read("proprio_user_data") as Map<String, dynamic>;

      currentUser = proprio.Objet(
        id: data['id'] ?? 0,
        nom: data['nom'] ?? '',
        prenom: data['prenom'] ?? '',
        telephone: data['telephone'] ?? '',
        email: data['email'] ?? '',
        password: data['password'] ?? '',
        status: data['status'] ?? '',
        idUser: data['id_user'] ?? 0,
        cleConnexion: data['cle_connexion'] ?? '',
      );
    } else {
      currentUser = proprio.Objet(id: null);
    }
    print("CURRENT USER: ${currentUser.toJson()}");
    return currentUser;
  }

  ///`SAVE USER DATA INTO LOCAL STORAGE`
  Future saveUserData(proprio.Objet model) async {
    box.write(
      "proprio_user_data",
      {
        "id": model.id,
        "nom": model.nom,
        "prenom": model.prenom,
        "telephone": model.telephone,
        "password": model.password,
        "email": model.email,
        "status": model.status,
        "id_user": model.idUser ?? 0,
        "cle_connexion": model.cleConnexion ?? '',
      },
    );
    await readUserData();
  }

  ///`SAVE USER DATA INTO LOCAL STORAGE`
  Future eraseUserData() async {
    box.write(
      tableName,
      {
        "id": 0,
        "nom": '',
        "prenom": '',
        "telephone": '',
        "password": '',
        "email": '',
        "status": 0,
        "id_user": 0,
        "cle_connexion": '',
      },
    );
    await readUserData();
  }

  @override
  void onInit() {
    readUserData();
    super.onInit();
  }
}

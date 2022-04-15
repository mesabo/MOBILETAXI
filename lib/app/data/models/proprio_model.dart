class Proprio {
  bool? bSuccess;
  String? message;
  bool? etatConnexion;
  List<Objet>? objet;

  Proprio({this.bSuccess, this.message, this.etatConnexion, this.objet});

  Proprio.fromJson(Map<String, dynamic> json) {
    bSuccess = json['bSuccess'];
    message = json['message'];
    etatConnexion = json['etat_connexion'];
    if (json['objet'] != null) {
      objet = <Objet>[];
      json['objet'].forEach((v) {
        objet?.add(Objet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bSuccess'] = bSuccess;
    data['message'] = message;
    data['etat_connexion'] = etatConnexion;
    if (objet != null) {
      data['objet'] = objet?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Objet {
  int? id;
  String? nom;
  String? prenom;
  String? email;
  String? telephone;
  String? password;
  int? status;
  String? urlien;
  int? idUser;
  String? cleConnexion;

  Objet(
      {this.id,
      this.nom,
      this.prenom,
      this.email,
      this.telephone,
      this.password,
      this.status,
      this.urlien,
      this.idUser,
      this.cleConnexion});

  Objet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    email = json['email'];
    telephone = json['telephone'];
    password = json['password'];
    status = json['status'];
    urlien = json['urlien'];
    idUser = json['id_user'];
    cleConnexion = json['cle_connexion'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['email'] = email;
    data['telephone'] = telephone;
    data['password'] = password;
    data['status'] = status;
    data['urlien'] = urlien;
    data['id_user'] = idUser;
    data['cle_connexion'] = cleConnexion;
    return data;
  }
}

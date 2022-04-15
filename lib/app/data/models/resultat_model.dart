class Resultat {
  bool? bSuccess;
  String? message;
  bool? etatConnexion;

  Resultat({this.bSuccess, this.message, this.etatConnexion});

  Resultat.fromJson(Map<String, dynamic> json) {
    bSuccess = json['bSuccess'];
    message = json['message'];
    etatConnexion = json['etat_connexion'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bSuccess'] = bSuccess;
    data['message'] = message;
    data['etat_connexion'] = etatConnexion;
    return data;
  }
}

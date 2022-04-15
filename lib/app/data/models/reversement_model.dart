class Reversement {
  bool? bSuccess;
  String? message;
  bool? etatConnexion;
  String? versementUrl;

  Reversement(
      {this.bSuccess, this.message, this.etatConnexion, this.versementUrl});

  Reversement.fromJson(Map<String, dynamic> json) {
    bSuccess = json['bSuccess'];
    message = json['message'];
    etatConnexion = json['etat_connexion'];
    versementUrl = json['versement_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bSuccess'] = bSuccess;
    data['message'] = message;
    data['etat_connexion'] = etatConnexion;
    data['versement_url'] = versementUrl;
    return data;
  }
}

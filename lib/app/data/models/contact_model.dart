class Contact {
  int? id;
  String? nom;
  String? prenom;
  String? telephone;

  Contact({this.id, this.nom, this.prenom, this.telephone});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    telephone = json['telephone'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['telephone'] = telephone;
    return data;
  }
}

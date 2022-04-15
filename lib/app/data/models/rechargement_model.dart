class Rechargement {
  bool? bSuccess;
  String? message;
  bool? etatConnexion;
  int? proprioId;
  int? solde;
  List<Operation>? operation;

  Rechargement(
      {this.bSuccess,
      this.message,
      this.etatConnexion,
      this.proprioId,
      this.solde,
      this.operation});

  Rechargement.fromJson(Map<String, dynamic> json) {
    bSuccess = json['bSuccess'];
    message = json['message'];
    etatConnexion = json['etat_connexion'];
    proprioId = json['proprio_id'];
    solde = json['solde'];
    if (json['operation'] != null) {
      operation = <Operation>[];
      json['operation'].forEach((v) {
        operation?.add(Operation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bSuccess'] = bSuccess;
    data['message'] = message;
    data['etat_connexion'] = etatConnexion;
    data['proprio_id'] = proprioId;
    data['solde'] = solde;
    if (operation != null) {
      data['operation'] = operation?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Operation {
  int? id;
  String? reference;
  int? montant;
  String? destinataireContact;
  String? beneficiaireId;
  String? beneficiaireContact;
  String? beneficiaireNom;
  String? beneficiairePrenom;
  String? type;
  String? date;
  String? status;

  Operation(
      {this.id,
      this.reference,
      this.montant,
      this.destinataireContact,
      this.beneficiaireId,
      this.beneficiaireContact,
      this.beneficiaireNom,
      this.beneficiairePrenom,
      this.type,
      this.date,
      this.status});

  Operation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reference = json['reference'];
    montant = json['montant'];
    destinataireContact = json['destinataire_contact'];
    beneficiaireId = json['beneficiaire_id'];
    beneficiaireContact = json['beneficiaire_contact'];
    beneficiaireNom = json['beneficiaire_nom'];
    beneficiairePrenom = json['beneficiaire_prenom'];
    type = json['type'];
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['reference'] = reference;
    data['montant'] = montant;
    data['destinataire_contact'] = destinataireContact;
    data['beneficiaire_id'] = beneficiaireId;
    data['beneficiaire_contact'] = beneficiaireContact;
    data['beneficiaire_nom'] = beneficiaireNom;
    data['beneficiaire_prenom'] = beneficiairePrenom;
    data['type'] = type;
    data['date'] = date;
    data['status'] = status;
    return data;
  }
}

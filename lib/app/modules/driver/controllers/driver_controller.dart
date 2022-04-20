import 'package:flutter/widgets.dart';
import 'package:fredy_proprio/app/constants/controllers.dart';
import 'package:fredy_proprio/app/data/models/driver_model.dart' as dri;
import 'package:fredy_proprio/app/data/models/resultat_model.dart' as result;
import 'package:fredy_proprio/app/data/models/resume_model.dart' as resu;
import 'package:fredy_proprio/app/data/models/vehicule_model.dart' as veh;
import 'package:fredy_proprio/app/data/models/vehicule_resume_model.dart' as vr;
import 'package:fredy_proprio/app/data/providers/providers.dart';
import 'package:fredy_proprio/app/data/services/local_storage.dart';
import 'package:fredy_proprio/app/routes/app_pages.dart';
import 'package:get/get.dart';

class DriverController extends GetxController {
  RxInt segmentedControlGroupValue = 0.obs;
  RxInt activeCurrentStep = 0.obs;
  RxInt? chosedVehicleIndex = 0.obs;
  RxString? chosedVehicleName = "".obs;

  TextEditingController searchTextTC = TextEditingController();
  TextEditingController vehiculeTC = TextEditingController();
  TextEditingController nomTC = TextEditingController();
  TextEditingController prenomTC = TextEditingController();
  TextEditingController telephoneTC = TextEditingController();
  TextEditingController nautorisationTC = TextEditingController();
  TextEditingController ncertaptitudeTC = TextEditingController();
  TextEditingController permisTC = TextEditingController();
  TextEditingController photoTC = TextEditingController();

  TextEditingController startTC = TextEditingController();
  TextEditingController endTC = TextEditingController();

  RxInt vehiculeID = 0.obs;
  RxInt driverID = 0.obs;
  RxString imagepath = "".obs;

  RxBool isEditing = false.obs;
  RxBool istLoading = false.obs;
  RxBool isFetching = false.obs;

  final vehicleSelected = veh.Objet().obs;

  final vehiclelibre = veh.Objet().obs;

  final driver = dri.Objet().obs;
  final driversList = <dri.Objet>[].obs;
  final tempDriverList = <dri.Objet>[].obs;
  final vehiculelibreList = <veh.Objet>[].obs;
  final tempVehiculelibreList = <veh.Objet>[].obs;
  Rx<vr.Objet> vehiculeResume = vr.Objet().obs;

  late FocusNode myFocusNode;
  var tooltipBehavior;

  DateTime datejour = DateTime.now();
  final isready = false.obs;

  final RxBool isLoading = false.obs;
  RxList<resu.Objet> historiqueDriverList = <resu.Objet>[].obs;
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endedDate = DateTime.now().obs;
  RxString dateJour = DateTime.now().toString().substring(0, 10).obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    ctlVehicule.listerVehicules();
    ctlDriver.ListerDrivers();
    super.onReady();
  }

  @override
  void onClose() {}

  ///`CLEAR TEXT CONTROLLERS`
  clearTextFields() {
    nomTC.text = "";
    prenomTC.text = "";
    permisTC.text = "";
    telephoneTC.text = "";
    // couleurTC.text = "";
    // anneeTC.text = "";
  }

  ///`RESUME VEHICULE`
  Future<vr.Objet> getVehiculeResume(vehicule_id) async {
    String _jour = DateTime.now().toString().substring(0, 10);
    istLoading.value = true;
    var _res = await provVehicule.getVehiculeResume(
        proprio_id: helper.proprioInfo.value.id ?? 0,
        cle_connexion: helper.proprioInfo.value.cleConnexion ?? '',
        vehicule_id: vehicule_id ?? 0,
        date_jour: _jour);
    if (_res.objet!.isNotEmpty) {
      vehiculeResume.value = _res.objet!.first;
    }
    istLoading.value = false;
    printInfo(info: vehiculeResume.value.toString());

    return vehiculeResume.value;
  }

  ///`VEHICULES LIBRES`
  Future<List<veh.Objet>> getVehiculeLibre() async {
    istLoading.value = true;

    var _res = await provDriver.getListerVehiculeLibre(
        cle_connexion: helper.proprioInfo.value.cleConnexion ?? '',
        proprio_id: helper.proprioInfo.value.id ?? 0);
    vehiculelibreList.value = _res.objet!;
    tempVehiculelibreList.value = vehiculelibreList;
    istLoading.value = false;
    return vehiculelibreList;
  }

  ///`AJOUTER VEHICULE`
  Future<result.Resultat> postDriver() async {
    String _jour = DateTime.now().toString().substring(0, 10);
    istLoading.value = true;
    result.Resultat _res = await provDriver.postDriver(
      cle_connexion: helper.proprioInfo.value.cleConnexion ?? '',
      proprio_id: helper.proprioInfo.value.id ?? 0,
      nom: nomTC.text.trim().toUpperCase(),
      prenom: prenomTC.text.trim().toUpperCase(),
      numero_permis: permisTC.text.trim().toUpperCase(),
      telephone: telephoneTC.text,
      image_permis: "NO_IMAGE",
      numero_autorisation: nautorisationTC.text.toString().trim(),
      numero_cert_aptitude: ncertaptitudeTC.text.toString().trim(),
    );
    clearTextFields();
    ctlVehicule.listerVehicules();
    ctlDriver.ListerDrivers();
    istLoading.value = false;
    return _res;
  }

  ///`UPDATE VEHICULE`
  Future<result.Resultat> putDriver() async {
    String _jour = DateTime.now().toString().substring(0, 10);
    istLoading.value = true;
    result.Resultat _res = await provDriver.putDriver(
      id: driver.value.id ?? 0,
      cle_connexion: helper.proprioInfo.value.cleConnexion ?? '',
      proprio_id: helper.proprioInfo.value.id ?? 0,
      nom: nomTC.text.trim().toUpperCase(),
      prenom: prenomTC.text.trim().toUpperCase(),
      numero_permis: permisTC.text.trim().toUpperCase(),
      telephone: telephoneTC.text,
      image_permis: "NO_IMAGE",
      numero_autorisation: nautorisationTC.text.toString().trim(),
      numero_cert_aptitude: ncertaptitudeTC.text.toString().trim(),
    );
    ctlVehicule.listerVehicules();
    ctlDriver.ListerDrivers();
    istLoading.value = false;
    return _res;
  }

  ///`ATTRIBUER VEHICULE`
  Future<result.Resultat> attribuerVehicule() async {
    istLoading.value = true;
    result.Resultat _res = await provDriver.putAttribuerVehicule(
        vehicule_id: vehicleSelected.value.id ?? 0,
        driver_id: driverID.value,
        cle_connexion: helper.proprioInfo.value.cleConnexion ?? '',
        id_user: helper.proprioInfo.value.id ?? 0);
    ctlVehicule.listerVehicules();
    ctlDriver.ListerDrivers();
    istLoading.value = false;
    return _res;
  }

  ///`LISTER CATEGORIES`
  Future ListerDrivers() async {
    istLoading.value = true;
    var _res = await provDriver.getListerDrivers(
      proprio_id: helper.proprioInfo.value.id ?? 0,
      cle_connexion: helper.proprioInfo.value.cleConnexion ?? '',
    );
    if (_res.etatConnexion == false) {
      LocalStorage().eraseUserData();
      Get.offAllNamed(Routes.SIGNIN);
    }
    driversList.value = _res.objet!;
    driversList.value = driversList.reversed.toList();
    tempDriverList.value = driversList.value;
    istLoading.value = false;
    return driversList;
  }

  ///`LISTER HISTORIQUE`
  Future<List<resu.Objet>> getHistorique() async {
    isLoading.value = true;
    var _res = await provDriver.getListerHistoriqueDrivers(
        cle_connexion: helper.proprioInfo.value.cleConnexion ?? '',
        proprio_id: helper.proprioInfo.value.id!.toInt(),
        driver_id: driver.value.id!.toInt(),
        date_debut: startDate.value.toString().substring(0, 10),
        date_fin: endedDate.value.toString().substring(0, 10));

    if (_res.etatConnexion == false) {
      LocalStorage().eraseUserData();
      Get.offAllNamed(Routes.SIGNIN);
    }
    historiqueDriverList.value = _res.objet ?? [];
    isLoading.value = false;

    return historiqueDriverList.value;
  }
}

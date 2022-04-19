import 'package:flutter/material.dart';
import 'package:fredy_proprio/app/constants/controllers.dart';
import 'package:fredy_proprio/app/data/models/dashboard_resumer_model.dart';
import 'package:fredy_proprio/app/data/providers/providers.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  Rx<Objet> dashboardResume = Objet().obs;
  final RxBool isLoading = false.obs;
  TextEditingController montantTC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    loadDashboardresume();
    ctlFinance.getFinanceresume();
    super.onReady();
  }

  @override
  void onClose() {}

  Future loadDashboardresume() async {
    isLoading.value = true;
    var _res = await provDashboard.getListerDashboardResumers(
        cle_connexion: helper.proprioInfo.value.cleConnexion ?? '',
        proprio_id: helper.proprioInfo.value.id ?? 0,
        date_jour: helper.startdate.value);
    if (_res.objet != null && _res.objet!.isNotEmpty) {
      dashboardResume.value = _res.objet!.first;
    } else {
      dashboardResume.value = Objet();
    }

    isLoading.value = false;
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fredy_proprio/app/data/models/licence_model.dart';
import 'package:get/get.dart';

class LicenceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<List<Licence>> loadLicences(BuildContext context) async {
    final bundle = DefaultAssetBundle.of(context);
    final licences = await bundle.loadString('assets/data/licences.json');

    return json
        .decode(licences)
        .map<Licence>((licence) => Licence.fromJson(licence))
        .toList();
  }
}

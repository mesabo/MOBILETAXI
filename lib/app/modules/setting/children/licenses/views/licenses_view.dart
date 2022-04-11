import 'package:flutter/material.dart';
import 'package:fredy_proprio/app/constants/controllers.dart';
import 'package:fredy_proprio/app/data/models/licence_model.dart';

import 'package:get/get.dart';

import '../controllers/licenses_controller.dart';
import 'licenses_widget.dart';

class LicensesView extends GetView<LicensesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Licence>>(
        future: ctlLicence.loadLicences(context),
        builder: (context, snapshot) {
          final licences = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return const Center(
                    child: Text('Echec de chargement de la licence!'));
              } else {
                return LicencesWidget(licences: licences!);
              }
          }
        },
      ),
    );
  }
}

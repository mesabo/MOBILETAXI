import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fredy_proprio/app/constants/controllers.dart'
    show ctlLicence, helper;
import 'package:fredy_proprio/app/data/models/licence_model.dart';
import 'package:fredy_proprio/app/routes/app_pages.dart';
import 'package:fredy_proprio/app/themes/colors/light_color.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/licence_controller.dart';
import 'licenses_widget.dart';

class LicenceView extends GetView<LicenceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Licence>>(
        future: ctlLicence.loadLicences(context),
        builder: (context, snapshot) {
          final licences = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: const CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return const Center(
                    child: const Text('Echec de chargement de la licence!'));
              } else {
                return Stack(
                  children: [
                    LicencesWidget(licences: licences!),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 8.h,
                          width: 100.w,
                          decoration:
                              const BoxDecoration(color: LightColor.yellow),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    print("refuser");
                                  },
                                  child: Text(
                                    "refuser",
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    print("accepter");
                                    Get.offAllNamed(helper.connected.value
                                        ? Routes.HOME
                                        : AppPages.INITIAL);
                                  },
                                  child: Text(
                                    "accepter",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp),
                                  )),
                            ],
                          ),
                        ))
                  ],
                );
              }
          }
        },
      ),
    );
  }
}

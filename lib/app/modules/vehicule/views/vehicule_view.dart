import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fredy_proprio/app/constants/controllers.dart';
import 'package:fredy_proprio/app/modules/driver/views/driver_add_view.dart';
import 'package:fredy_proprio/app/modules/driver/views/driver_items_view.dart';

import 'package:get/get.dart';

import '../controllers/vehicule_controller.dart';
import 'driver_items_view.dart';
import 'vehicule_add_view.dart';

class VehiculeView extends GetView<VehiculeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: CupertinoPageScaffold(
            child: CustomScrollView(
              slivers: [
                // The CupertinoSliverNavigationBar
                CupertinoSliverNavigationBar(
                  leading: Material(
                    child: Row(
                      children: [
                        const Text(
                          'Total: ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w100),
                        ),
                        Text(
                          '${ctlVehicule.tempVehiculeList.length}',
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  // middle: const Text("Gestion Véhicules"),
                  trailing: Material(
                      child: IconButton(
                    icon: const Icon(CupertinoIcons.add_circled_solid),
                    onPressed: () async {
                      ctlVehicule.listerCategories();
                      // await ctlVehicule.ListerCategories();
                      Get.to(() => VehiculeAddView());
                    },
                  )),
                  largeTitle: CupertinoSearchTextField(
                    controller: ctlVehicule.searchTextTC,
                    placeholder: 'Chercher ....',
                    onTap: () {
                      ctlVehicule.tempVehiculeList.value =
                          ctlVehicule.vehiculesList;
                    },
                    onChanged: (value) {
                      ctlVehicule.tempVehiculeList.value = ctlVehicule
                          .vehiculesList
                          .where((p0) =>
                              p0.immatriculation!
                                  .toLowerCase()
                                  .contains(value.toLowerCase()) ||
                              p0.marque!
                                  .toLowerCase()
                                  .contains(value.toLowerCase()) ||
                              p0.modele!
                                  .toLowerCase()
                                  .contains(value.toLowerCase()) ||
                              p0.couleur!
                                  .toLowerCase()
                                  .contains(value.toLowerCase()) ||
                              p0.annee!
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                          .toList();
                    },
                    onSuffixTap: () {
                      ctlVehicule.searchTextTC.text = "";
                      ctlVehicule.tempVehiculeList.value =
                          ctlVehicule.vehiculesList.value;
                    },
                  ),
                ),

                // Other sliver elements
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) =>
                      VehiculeItemsView(ctlVehicule.tempVehiculeList[0]),
                  childCount: ctlVehicule.tempVehiculeList.length,
                )),
              ],
            ),
          ),
        ));
  }
}

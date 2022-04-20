import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fredy_proprio/app/constants/controllers.dart';
import 'package:fredy_proprio/app/data/models/vehicule_model.dart';
import 'package:fredy_proprio/app/modules/vehicule/views/vehicule_add_view.dart';
import 'package:fredy_proprio/app/utils/app_images.dart';
import 'package:get/get.dart';

class VehiculeDetailNestedScrollModal extends StatelessWidget {
  final Objet vehicule;
  VehiculeDetailNestedScrollModal({Key? key, required this.vehicule})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
              child: SizedBox(
                height: 10,
                width: 50,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                      height: 5.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      )),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage(AppImage.carImage),
                  ),
                  title: Text(
                    "${vehicule.marque ?? 'marque'} - ${vehicule.modele ?? 'modele'}",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "IMMAT ${vehicule.immatriculation ?? ''}",
                    style:
                        TextStyle(color: primary, fontWeight: FontWeight.w500),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Get.back();
                        ctlVehicule.vehicule.first = vehicule;
                        ctlVehicule.vehiculeDate.value =
                            DateTime.tryParse(vehicule.annee.toString()) ??
                                DateTime.now();
                        ctlVehicule.isEditing.value = true;
                        ctlVehicule.immatTC.text =
                            vehicule.immatriculation.toString();
                        ctlVehicule.modelTC.text = vehicule.modele.toString();
                        ctlVehicule.marqueTC.text = vehicule.marque.toString();
                        ctlVehicule.couleurTC.text =
                            vehicule.couleur.toString();
                        ctlVehicule.numeroAssuranceTC.value =
                            vehicule.numeroAssurance ?? false;
                        ctlVehicule.numeroVignetteTC.value =
                            vehicule.numeroVignette ?? false;
                        ctlVehicule.numeroCarteTransportTC.text =
                            vehicule.numeroCarteTransport.toString();

                        Get.to(() => VehiculeAddView());
                      },
                      icon: const Icon(FontAwesomeIcons.edit)),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ],
        )),
      ),
    );
  }

  final Color primary = const Color(0xffE20056);
  final Color secondary = const Color(0xFFF3D00A);
  final Color border = const Color(0xffE1DDDE);
  final Color bg = const Color(0xfffefefe);
  final List<bool> toggleIsSelected = [true, false, false];
}

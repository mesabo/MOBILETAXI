import 'package:fredy_proprio/app/constants/controllers.dart';
import 'package:fredy_proprio/app/data/models/rechargement_model.dart';
import 'package:fredy_proprio/app/modules/rechargement/views/contacter_particulier.dart';
import 'package:fredy_proprio/app/themes/colors/light_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'widgets/balance_card.dart';
import 'widgets/title_text.dart';

class RechargementView extends StatefulWidget {
  const RechargementView({Key? key}) : super(key: key);

  @override
  State<RechargementView> createState() => _RechargementViewState();
}

class _RechargementViewState extends State<RechargementView> {
  Widget _operationsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _icon(Icons.drive_eta_outlined, "Chauffeur",
            () => Get.to(() => const ContacterParticulier())),
      ],
    );
  }

  Widget _icon(IconData icon, String text, openPage) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: openPage,
          child: Container(
            height: 80,
            width: 85.w,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
                color: LightColor.grey,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color(0xfff3f3f3),
                      offset: Offset(5, 5),
                      blurRadius: 10)
                ]),
            child: Icon(icon),
          ),
        ),
        Text(text,
            style: GoogleFonts.mulish(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: const Color(0xff76797e))),
      ],
    );
  }

  // Widget _transectionList() {
  //   return ListView(
  //     shrinkWrap: true,
  //     children: <Widget>[
  //       for (var operation
  //           in ctlRechargement.rechargements.value.operation ?? [])
  //         _transection(operation: operation),
  //     ],
  //   );
  // }

  Widget _transaction({required Operation operation}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(),
      title: TitleText(
        text:
            "${operation.destinataireContact ?? ''} à ${operation.beneficiaireContact ?? ''}",
        fontSize: 14,
      ),
      subtitle: Text(operation.date ?? ""),
      trailing: Container(
          height: 30,
          width: 30.w,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: LightColor.lightGrey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(
              '+${ctlRechargement.currency.format(operation.montant, ctlRechargement.unitSettings)}',
              style: GoogleFonts.mulish(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: LightColor.navyBlue2))),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await ctlRechargement.listerHistoriqueRecharges();
          // await ctlRechargement.listercontactServiceRecharge();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              SizedBox(
                height: 60.h,
                child: ListView(children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(CupertinoIcons.left_chevron)),
                        const TitleText(text: "Mon solde (Argent comptant)")
                      ]),
                  BalanceCard(
                      montant: ctlRechargement.rechargements.value.solde),
                  const SizedBox(height: 10),
                  const TitleText(text: "Recharger Compte"),
                  _operationsWidget(),
                  const SizedBox(height: 40),
                  const TitleText(text: "Historique Transactions"),
                  const Divider(thickness: 2)
                ]),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 40.h,
                    child: Obx(() => ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            for (var operation in ctlRechargement
                                    .rechargements.value.operation ??
                                [])
                              _transaction(operation: operation),
                          ],
                        )),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:fredy_proprio/app/data/models/licence_model.dart';

class LicencesWidget extends StatelessWidget {
  final List<Licence> licences;

  const LicencesWidget({Key? key, required this.licences}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 24),
          itemCount: licences.length,
          itemBuilder: (context, index) {
            final licence = licences[index];
            return ListTile(
              title: Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  "${licence.title}",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text(
                "${licence.text}",
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            );
          },
        ),
      );
}

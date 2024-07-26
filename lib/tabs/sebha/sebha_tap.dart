import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../settings/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTap extends StatefulWidget {
  const SebhaTap({Key? key}) : super(key: key);

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int counter = 0;
  int index = 0;
  double angle = 0;
  List<String> doaa = ['سبحان الله', 'الله  اكبر'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "images/${Provider.of<SettingsProvider>(context).headSebha}",
                  height: 110,
                ),
              ),
            ),
            GestureDetector(
              onTap: counterMethod,
              child: Padding(
                padding: EdgeInsets.only(top: 80),
                child: Align(
                  alignment: Alignment.center,
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                        "images/${Provider.of<SettingsProvider>(context).sebhaName}"),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          AppLocalizations.of(context)!.counter,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromRGBO(183, 147, 95, 1).withOpacity(0.57),
          ),
          child: Text(
            counter.toString(),
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromRGBO(183, 147, 95, 1),
          ),
          child: Text(
            doaa[index],
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 25, color: Colors.white),
          ),
        ),
      ],
    );
  }

  counterMethod() {
    angle += 10;
    if (counter == 33) {
      counter = 0;
      if (index < doaa.length - 1) {
        index++;
      } else {
        index = 0;
      }
    } else {
      counter++;
    }

    setState(() {});
  }
}

import 'package:flutter/material.dart';
import 'package:islamic_app/tabs/hadeth/hadeth_data.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';
import '../settings/settings_provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "HadethDetailsScreen";

  HadethDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HadethData hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethData;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "images/${Provider.of<SettingsProvider>(context).backgroundImageName}.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(hadeth.title),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
                horizontal: MediaQuery.of(context).size.width * 0.05),
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: ListView.builder(
              itemCount: hadeth.content.length,
              itemBuilder: (context, index) {
                return Text(
                  hadeth.content[index],
                  style: Theme.of(context).textTheme.titleMedium,
                  textDirection: TextDirection.rtl,
                );
              },
            ),
          ),
        ));
  }
}

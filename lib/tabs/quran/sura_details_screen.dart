import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/theme.dart';
import 'package:islamic_app/widgets/loading_indicater.dart';
import 'package:provider/provider.dart';

import '../settings/settings_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetailsScreen";
  SuraDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArg args =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArg;
    if (ayat.isEmpty) {
      loadSuraFile(args.index);
    }
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "images/${Provider.of<SettingsProvider>(context).backgroundImageName}.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.suraName),
          ),
          body: ayat.isEmpty
              ? LoadingIndecater()
              : Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.05,
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: ListView.builder(
                    itemCount: ayat.length,
                    itemBuilder: (context, index) {
                      return Text(
                        ayat[index],
                        style: Theme.of(context).textTheme.titleMedium,
                        textDirection: TextDirection.rtl,
                      );
                    },
                  ),
                ),
        ));
  }

  void loadSuraFile(int index) async {
    // print("images/files/${index}.txt");
    String sura = await rootBundle.loadString("images/files/${index}.txt");
    ayat = sura.split("\n");
    print("mmmmmmmmmmmmmmmmmmm\n");

    setState(() {});
  }
}

class SuraDetailsArg {
  int index;
  String suraName;
  SuraDetailsArg({required this.index, required this.suraName});
}

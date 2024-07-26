import 'package:flutter/material.dart';
import 'package:islamic_app/tabs/hadeth/hadeth_tab.dart';
import 'package:islamic_app/tabs/quran/quran_tap.dart';
import 'package:islamic_app/tabs/radio/radio_tap.dart';
import 'package:islamic_app/tabs/sebha/sebha_tap.dart';
import 'package:islamic_app/tabs/settings/settings_provider.dart';
import 'package:islamic_app/tabs/settings/settings_tap.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static String routName = "HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTap(),
    SettingTap()
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "images/${Provider.of<SettingsProvider>(context).backgroundImageName}.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.islami),
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              // fixedColor: Colors.blue,
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;

                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('images/icon_quran.png'),
                    ),
                    label: 'quran'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('images/icon_hadeth.png'),
                    ),
                    label: 'hadeth'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('images/icon_sebha.png'),
                    ),
                    label: 'sebha'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('images/icon_radio.png'),
                    ),
                    label: 'Radio'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined), label: 'Setting'),
              ]),
          body: tabs[selectedIndex]),
    );
  }
}

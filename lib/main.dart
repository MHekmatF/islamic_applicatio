import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamic_app/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islamic_app/tabs/quran/sura_details_screen.dart';
import 'package:islamic_app/tabs/settings/settings_provider.dart';
import 'package:islamic_app/theme.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// void main() {
//   runApp(ChangeNotifierProvider(
//       create: (context) {
//         return SettingsProvider();
//       },
//       child: IslamiApp()));
// }

//eng noura
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SettingsProvider provider = SettingsProvider();
  await provider.loadThemeData();
  runApp(ChangeNotifierProvider(
      create: (context) {
        return provider;
      },
      child: IslamiApp()));
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return
        // ChangeNotifierProvider(
        //   create: (context) {
        //     return SettingsProvider();
        //   },
        //   child:
        // Builder(builder: (ctx) {returnx
        MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              HomeScreen.routName: (_) => HomeScreen(),
              SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
              HadethDetailsScreen.routeName: (_) => HadethDetailsScreen()
            },
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(settingsProvider.languageCode),
            initialRoute: HomeScreen.routName,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            // themeMode: Provider.of<SettingsProvider>(ctx).themeMode);
            themeMode: settingsProvider.themeMode);
    // }),
    // );
  }
}

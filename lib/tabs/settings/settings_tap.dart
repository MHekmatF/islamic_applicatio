import 'package:flutter/material.dart';
import 'package:islamic_app/tabs/settings/settings_provider.dart';
import 'package:islamic_app/theme.dart';
import 'package:provider/provider.dart';

class SettingTap extends StatefulWidget {
  const SettingTap({Key? key}) : super(key: key);

  @override
  State<SettingTap> createState() => _SettingTapState();
}

class _SettingTapState extends State<SettingTap> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربية', code: 'ar')
  ];
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dark Mood",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Switch(
                  activeTrackColor: Theme.of(context).primaryColor,
                  inactiveTrackColor: Theme.of(context).primaryColor,
                  thumbColor: MaterialStatePropertyAll(AppTheme.white),
                  value: settingsProvider.themeMode == ThemeMode.dark,
                  onChanged: (f) {
                    if (f == true) {
                      settingsProvider.changeTheme(ThemeMode.dark);
                    } else {
                      settingsProvider.changeTheme(ThemeMode.light);
                    }
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Language : ",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.23,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Language>(
                    /* this is one item just*/
                    value: languages.firstWhere(
                        (lang) => lang.code == settingsProvider.languageCode),
                    // settingsProvider.languageCode == 'en'
                    //     ? 'English'
                    //     : 'العربية',
                    items: languages
                        .map((language) => DropdownMenuItem<Language>(
                              /* this is list of item */

                              value: language,
                              child: Text(
                                language.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ))
                        .toList(),
                    onChanged: (selectedLanguage) {
                      if (selectedLanguage != null) {
                        settingsProvider.changeLanguage(selectedLanguage.code);
                      }
                    },
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Language {
  String name;
  String code;
  Language({required this.name, required this.code});
}

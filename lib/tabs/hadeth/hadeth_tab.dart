import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/tabs/hadeth/hadeth_data.dart';
import 'package:islamic_app/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islamic_app/widgets/loading_indicater.dart';

class HadethTap extends StatefulWidget {
  const HadethTap({Key? key}) : super(key: key);

  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<HadethData> hadeth = [];

  @override
  Widget build(BuildContext context) {
    if (hadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("images/hadeth_logo.png"),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: hadeth.isEmpty
              ? const LoadingIndecater()
              : ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        HadethDetailsScreen.routeName,
                        arguments: hadeth[index],
                      );
                    },
                    child: Text(
                      hadeth[index].title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  itemCount: hadeth.length,
                ),
        ),
        // const Text(
        //   "ddd",
        //   // style: GoogleFonts.elMessiri(),
        // ),
      ],
    );
  }

  Future<void> loadHadethFile() async {
    // print("images/files/${index}.txt");
    String ahadethFileContent =
        await rootBundle.loadString("images/files/ahadeth.txt");
    // print(ahadethFileContent);
    // List<String> ahadethStrings = ahadethFileContent.split('#');
    List<String> ahadethStrings = ahadethFileContent.split('#\r\n');
    hadeth = ahadethStrings.map((hadethString) {
      // List<String> hadethLine = hadethString.trim().split("\n");
      List<String> hadethLine = hadethString.split("\n");
      String title = hadethLine[0];
      hadethLine.removeAt(0);
      List<String> content = hadethLine;
      return HadethData(title, content);
    }).toList();
    setState(() {});
  }
}

import 'package:flutter/material.dart';
import 'package:islamic_app/tabs/radio/radio_provider.dart';
import 'package:provider/provider.dart';

class RadioTap extends StatelessWidget {
  const RadioTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RadioProvider()..getRadioData(),
      child: Consumer<RadioProvider>(
        builder:
            (BuildContext context, RadioProvider myProvider, Widget? child) {
          print(myProvider.data.length);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2,child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/radio_image.png'),
                  const Text('اذاعة القران الكريم'),

                ],
              )),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myProvider.data.length,
                  physics: PageScrollPhysics(),
                  itemBuilder: (context, index) =>  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Text(myProvider.data[index].name??""),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            InkWell(
                              onTap: (){
                                myProvider.stopAudio();
                              },
                              child: Icon(
                                Icons.pause,
                                size: 40,
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                myProvider.playAudio(index);

                              },
                              child: Icon(
                                Icons.play_arrow,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

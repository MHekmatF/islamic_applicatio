


import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../api_manager.dart';
import '../../models/radio_model/radio.dart';

class RadioProvider with ChangeNotifier{
  final player=AudioPlayer();

  List<Radios>data=[];
   getRadioData()async{
  data= await ApiManager.getRadioData();
  notifyListeners();
  print('****************');
  print(data[0]);
  print('****************');
  }
  playAudio(int index)async{
     await player.play(UrlSource(data[index].url??''));
     notifyListeners();
  }
  stopAudio(){
     player.stop();
     notifyListeners();
  }

}
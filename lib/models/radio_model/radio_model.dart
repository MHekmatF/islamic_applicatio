import 'radio.dart';

class RadioModel {
  List<Radios>? radios;

  RadioModel({this.radios});

  factory RadioModel.fromJson(Map<String, dynamic> json) => RadioModel(
        radios: (json['radios'] as List<dynamic>?)
            ?.map((e) => Radios.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'radios': radios?.map((e) => e.toJson()).toList(),
      };
}

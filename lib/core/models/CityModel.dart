import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CityModel.freezed.dart';
part 'CityModel.g.dart';

@freezed
abstract class CityModel with _$CityModel {
  const factory CityModel(
      {@required String countryCode,
      @required String countryName,
      @required String langCode,
      @required String name,
      @required int utc}) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  static final cities = <CityModel>[
    ...turkeyCities
        .map((name) => CityModel(
            countryCode: "tr",
            langCode: "tr",
            name: name,
            utc: 3,
            countryName: 'Turkey'))
        .toList(),
    CityModel(
        countryCode: "us",
        langCode: "en",
        name: 'USA',
        utc: -4,
        countryName: 'USA'),
    CityModel(
        countryCode: "us",
        langCode: "en",
        name: "Washington DC",
        utc: -4,
        countryName: 'USA'),
    CityModel(
        countryCode: "us",
        langCode: "en",
        name: "Los Angeles",
        utc: -7,
        countryName: 'USA'),
  ];
}

@freezed
abstract class CountryModel with _$CountryModel {
  const factory CountryModel(
      {@required String name,
      @required CityModel capital,
      @required String code,
      @required String langCode,
      @required List<CityModel> cities}) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  static final _turkey = CountryModel(
      langCode: "tr",
      capital: CityModel.cities.singleWhere((city) => city.name == "Ankara"),
      name: "Turkey",
      code: "tr",
      cities:
          CityModel.cities.where((city) => city.countryCode == "tr").toList());

  static final _usa = CountryModel(
      langCode: "en",
      capital:
          CityModel.cities.singleWhere((city) => city.name == "Washington DC"),
      name: "USA",
      code: "us",
      cities:
          CityModel.cities.where((city) => city.countryCode == "us").toList());

  static final countries = [_turkey, _usa];

  static CountryModel getCountryFromLocale(BuildContext context) {
    final locale = Localizations.localeOf(context);

    switch (locale.countryCode) {
      case "tr":
        return _turkey;
      case "us":
        return _usa;
      default:
        return _turkey;
    }
  }
}

final turkeyCities = [
  "Turkey",
  "İstanbul",
  "Ankara",
  "İzmir",
  "Adana",
  "Adıyaman",
  "Afyonkarahisar",
  "Ağrı",
  "Amasya",
  "Antalya",
  "Artvin",
  "Aydın",
  "Balıkesir",
  "Bilecik",
  "Bingöl",
  "Bitlis",
  "Bolu",
  "Burdur",
  "Bursa",
  "Çanakkale",
  "Çankırı",
  "Çorum",
  "Denizli",
  "Diyarbakır",
  "Edirne",
  "Elâzığ",
  "Erzincan",
  "Erzurum",
  "Eskişehir",
  "Gaziantep",
  "Giresun",
  "Gümüşhane",
  "Hakkâri",
  "Hatay",
  "Isparta",
  "Mersin",
  "Kars",
  "Kastamonu",
  "Kayseri",
  "Kırklareli",
  "Kırşehir",
  "Kocaeli",
  "Konya",
  "Kütahya",
  "Malatya",
  "Manisa",
  "Kahramanmaraş",
  "Mardin",
  "Muğla",
  "Muş",
  "Nevşehir",
  "Niğde",
  "Ordu",
  "Rize",
  "Sakarya",
  "Samsun",
  "Siirt",
  "Sinop",
  "Sivas",
  "Tekirdağ",
  "Tokat",
  "Trabzon",
  "Tunceli",
  "Şanlıurfa",
  "Uşak",
  "Van",
  "Yozgat",
  "Zonguldak",
  "Aksaray",
  "Bayburt",
  "Karaman",
  "Kırıkkale",
  "Batman",
  "Şırnak",
  "Bartın",
  "Ardahan",
  "Iğdır",
  "Yalova",
  "Karabük",
  "Kilis",
  "Osmaniye",
  "Düzce"
];

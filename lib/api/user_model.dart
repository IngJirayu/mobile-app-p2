import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.accidentDate,
    required this.accidentTime,
    required this.expwStep,
    required this.weatherState,
    required this.injurMan,
    required this.injurFemel,
    required this.deadMan,
    required this.deadFemel,
    required this.cause,
  });

  int id;
  DateTime accidentDate;
  String accidentTime;
  String expwStep;
  WeatherState? weatherState;
  int injurMan;
  int injurFemel;
  int deadMan;
  int deadFemel;
  String cause;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        accidentDate: DateTime.parse(json["accident_date"]),
        accidentTime: json["accident_time"],
        expwStep: json["expw_step"],
        weatherState: weatherStateValues.map[json["weather_state"]],
        injurMan: json["injur_man"],
        injurFemel: json["injur_femel"],
        deadMan: json["dead_man"],
        deadFemel: json["dead_femel"],
        cause: json["cause"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "accident_date":
            "${accidentDate.year.toString().padLeft(4, '0')}-${accidentDate.month.toString().padLeft(2, '0')}-${accidentDate.day.toString().padLeft(2, '0')}",
        "accident_time": accidentTime,
        "expw_step": expwStep,
        "weather_state": weatherStateValues.reverse[weatherState],
        "injur_man": injurMan,
        "injur_femel": injurFemel,
        "dead_man": deadMan,
        "dead_femel": deadFemel,
        "cause": cause,
      };
}

enum WeatherState { EMPTY, WEATHER_STATE }

final weatherStateValues = EnumValues(
    {"ปกติ": WeatherState.EMPTY, "ฝนตก": WeatherState.WEATHER_STATE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    return reverseMap;
  }
}

// test json

// import 'dart:convert';
//
// List<UserModel> userModelFromJson(String str) =>
//     List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));
//
// String userModelToJson(List<UserModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class UserModel {
//   UserModel({
//     required this.id,
//     required this.name,
//     required this.username,
//     required this.email,
//     required this.address,
//     required this.phone,
//     required this.website,
//     required this.company,
//   });
//
//   int id;
//   String name;
//   String username;
//   String email;
//   Address address;
//   String phone;
//   String website;
//   Company company;
//
//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         id: json["id"],
//         name: json["name"],
//         username: json["username"],
//         email: json["email"],
//         address: Address.fromJson(json["address"]),
//         phone: json["phone"],
//         website: json["website"],
//         company: Company.fromJson(json["company"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "username": username,
//         "email": email,
//         "address": address.toJson(),
//         "phone": phone,
//         "website": website,
//         "company": company.toJson(),
//       };
// }
//
// class Address {
//   Address({
//     required this.street,
//     required this.suite,
//     required this.city,
//     required this.zipcode,
//     required this.geo,
//   });
//
//   String street;
//   String suite;
//   String city;
//   String zipcode;
//   Geo geo;
//
//   factory Address.fromJson(Map<String, dynamic> json) => Address(
//         street: json["street"],
//         suite: json["suite"],
//         city: json["city"],
//         zipcode: json["zipcode"],
//         geo: Geo.fromJson(json["geo"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "street": street,
//         "suite": suite,
//         "city": city,
//         "zipcode": zipcode,
//         "geo": geo.toJson(),
//       };
// }
//
// class Geo {
//   Geo({
//     required this.lat,
//     required this.lng,
//   });
//
//   String lat;
//   String lng;
//
//   factory Geo.fromJson(Map<String, dynamic> json) => Geo(
//         lat: json["lat"],
//         lng: json["lng"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "lat": lat,
//         "lng": lng,
//       };
// }
//
// class Company {
//   Company({
//     required this.name,
//     required this.catchPhrase,
//     required this.bs,
//   });
//
//   String name;
//   String catchPhrase;
//   String bs;
//
//   factory Company.fromJson(Map<String, dynamic> json) => Company(
//         name: json["name"],
//         catchPhrase: json["catchPhrase"],
//         bs: json["bs"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "catchPhrase": catchPhrase,
//         "bs": bs,
//       };
// }

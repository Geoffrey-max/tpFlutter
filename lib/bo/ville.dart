import 'package:tpflutter/bo/image.dart';

class Ville {
  int id;
  String name;
  Image pic;

  Ville(this.id, this.name, this.pic);

  Ville.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        pic = Image.fromJson(json["pic"]);

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "pic": pic.toJson()
  };


}
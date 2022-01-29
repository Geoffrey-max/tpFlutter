import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:tpflutter/bo/ville.dart';

class Logement {
  int id;
  String title;
  Ville place;
  num price;
  String owner;
  String? description;
  num lat;
  num lng;
  List<String> listDateAvailable;

  Logement(this.id, this.title, this.place, this.price, this.owner,
      this.description, this.lat, this.lng, this.listDateAvailable);

  Logement.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        title = json['title'],
        place = Ville.fromJson(json["place"]),
        price = json['price'],
        owner = json['owner'],
        description = json['description'],
        lat = json['lat'],
        lng = json['lng'],
        listDateAvailable = List.from(json['listDateAvailable']);

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "place": place.toJson(),
    "price": price,
    "owner": owner,
    "description": description,
    "lat": lat,
    "lng": lng,
    "listDateAvailable": listDateAvailable.toList()
  };
}
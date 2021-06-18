import 'dart:convert';

import 'package:rooms_app/core/local_storage/db_helper.dart';

class Room {
  Room({
    this.report,
    this.roomId,
    this.roomType,
    this.img,
    this.name,
    this.descrip,
  });

  String report;
  int roomId;
  int roomType;
  String img;
  String name;
  String descrip;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        report: json["report"],
        roomId: int.parse(json["room_id"]),
        roomType: int.parse(json["room_type"]),
        img: json["img"],
        name: json["name"],
        descrip: json["descrip"],
      );

  Map<String, dynamic> toJson() => {
        "report": report,
        "room_id": roomId,
        "room_type": roomType,
        "img": img,
        "name": name,
        "descrip": descrip,
      };

  Map<String, dynamic> toMap() {
    return {
      DbHelper.COLUMN_IND: roomId,
      DbHelper.COLUMN_NAME: name,
      DbHelper.COLUMN_IMG: img,
      DbHelper.COLUMN_TYPE: roomType,
      DbHelper.COLUMN_DESCRIP: descrip,
    };
  }

  factory Room.fromDatabase(Map<String, dynamic> json) => Room(
      roomId: json[DbHelper.COLUMN_IND],
      name: json[DbHelper.COLUMN_NAME],
      roomType: json[DbHelper.COLUMN_TYPE],
      img: json[DbHelper.COLUMN_IMG],
      descrip: json[DbHelper.COLUMN_DESCRIP]);
}

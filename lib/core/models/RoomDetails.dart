import 'dart:convert';

import 'package:rooms_app/core/local_storage/db_helper.dart';

class RoomDetails {
  RoomDetails({
    this.imgRoom,
    this.nameRoom,
    this.descripRoom,
    this.report,
    this.switchFx,
    this.controlId,
    this.icon,
    this.name,
    this.urlLive,
    this.urlLoc,
    this.lane,
  });

  String imgRoom;
  String nameRoom;
  String descripRoom;
  String report;
  String switchFx;
  String controlId;
  String icon;
  String name;
  String urlLive;
  String urlLoc;
  String lane;

  factory RoomDetails.fromJson(Map<String, dynamic> json) => RoomDetails(
        imgRoom: json["img_room"],
        nameRoom: json["name_room"],
        descripRoom: json["descrip_room"],
        report: json["report"],
        switchFx: json["switch_fx"],
        controlId: json["control_id"],
        icon: json["icon"],
        name: json["name"],
        urlLive: json["url_live"],
        urlLoc: json["url_loc"],
        lane: json["lane"],
      );

  Map<String, dynamic> toJson() => {
        "img_room": imgRoom,
        "name_room": nameRoom,
        "descrip_room": descripRoom,
        "report": report,
        "switch_fx": switchFx,
        "control_id": controlId,
        "icon": icon,
        "name": name,
        "url_live": urlLive,
        "url_loc": urlLoc,
        "lane": lane,
      };

  Map<String, dynamic> toMap() {
    return {
      DbHelper.COLUMN_SWITCH: switchFx,
      DbHelper.COLUMN_NAME: nameRoom,
      DbHelper.COLUMN_IMG: imgRoom,
      DbHelper.COLUMN_DESCRIP: descripRoom,
    };
  }

  factory RoomDetails.fromDatabase(Map<String, dynamic> json) => RoomDetails(
        nameRoom: json[DbHelper.COLUMN_NAME],
        imgRoom: json[DbHelper.COLUMN_IMG],
        descripRoom: json[DbHelper.COLUMN_DESCRIP],
        switchFx: json[DbHelper.COLUMN_SWITCH],
      );
}

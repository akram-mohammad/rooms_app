import 'dart:convert';

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
  String roomId;
  String roomType;
  String img;
  String name;
  String descrip;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        report: json["report"],
        roomId: json["room_id"],
        roomType: json["room_type"],
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
}

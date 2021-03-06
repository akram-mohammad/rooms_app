import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rooms_app/core/models/Room.dart';
import 'package:rooms_app/core/models/RoomDetails.dart';

class RoomService {
  Future<List<Room>> fetchRooms() async {
    final response = await http.get(
      Uri.parse(
          ('https://www.vartola.net/server/home_phone/task/getroomslist.php?fx_id=1&sk=sk_5fe73fe704b8e')),
    );
    if (response.statusCode == 200) {
      var results = List<Room>.from(
        (json.decode(response.body)).map((e) => Room.fromJson((e))),
      );
      return results;
    } else {
      throw Exception('FAILED TO LOAD ROOMS');
    }
  }

  Future<RoomDetails> fetchRoom(int id, int type) async {
    final response = await http.get(
      Uri.parse(
          ('https://www.vartola.net/server/home_phone/task/get_room_devices.php?fx_id=1&sk=sk_5fe73fe704b8e&room_id=$id&room_type=$type')),
    );
    if (response.statusCode == 200) {
      var result = RoomDetails.fromJson(json.decode(response.body));
      return result;
    } else {
      throw Exception('Failed To Load Room Details');
    }
  }
}

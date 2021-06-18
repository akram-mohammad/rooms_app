import 'package:connectivity/connectivity.dart';
import 'package:rooms_app/core/local_storage/db_helper.dart';
import 'package:rooms_app/core/models/Room.dart';
import 'package:rooms_app/core/models/RoomDetails.dart';
import 'package:rooms_app/core/services/room_service.dart';

class RoomRepository {
  RoomService _roomService = RoomService();

  Future<List<Room>> fetchRooms() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    final DbHelper dbHelper = DbHelper.instance;
    if (connectivityResult == ConnectivityResult.none) {
      List<Map<String, dynamic>> dbRoomsMap = await dbHelper.queryAllRows();
      List<Room> dbRooms = dbRoomsMap.map((e) => Room.fromDatabase(e)).toList();
      return dbRooms;
    } else {
      final networkRooms = await _roomService.fetchRooms();
      for (final actor in networkRooms) {
        dbHelper.insert(actor.toMap());
      }
      return networkRooms;
    }
  }

  Future<RoomDetails> fetchRoom(id, type, index) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    final dbHelper = DbHelper.instance;
    if (connectivityResult == ConnectivityResult.none) {
      List<Map<String, dynamic>> dbRoomsMap = await dbHelper.queryAllRows();
      final Map<String, dynamic> dbRoomMap = dbRoomsMap.firstWhere((element) {
        return element[DbHelper.COLUMN_ID] == index;
      });
      print(dbRoomMap);
      RoomDetails dbRoom = RoomDetails.fromDatabase(dbRoomMap);
      print(dbRoom.switchFx);
      print(dbRoom.nameRoom);
      return dbRoom;
    } else {
      final RoomDetails netRoom = await _roomService.fetchRoom(id, type);
      dbHelper.update(netRoom.toMap(), index);
      return netRoom;
    }
  }
}

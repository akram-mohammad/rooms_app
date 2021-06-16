import 'package:connectivity/connectivity.dart';
import 'package:rooms_app/core/local_storage/db_helper.dart';
import 'package:rooms_app/core/models/Room.dart';
import 'package:rooms_app/core/services/room_service.dart';

class RoomRepository {
  RoomService _roomService = RoomService();

  Future<List<Room>> fetchRooms() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    final DbHelper dbHelper = DbHelper.instance;
    if (connectivityResult == ConnectivityResult.none) {
      // List<Map<String, dynamic>> dbRoomsMap = await dbHelper.queryAllRows();
      // List<Room> dbActors =
      // dbRoomsMap.map((e) => Room.fromDatabase(e)).toList();
      return null;
    } else {
      final networkRooms = await _roomService.fetchRooms();
      // for (final actor in netActors) {
      //   dbHelper.insert(actor.toMap(index));
      //   index++;
      // }
      return networkRooms;
    }
  }
}

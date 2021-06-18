import 'package:flutter/material.dart';
import 'package:rooms_app/core/models/Room.dart';
import 'package:rooms_app/core/models/RoomDetails.dart';
import 'package:rooms_app/core/repositories/room_repository.dart';

class RoomsProvider extends ChangeNotifier {
  RoomRepository _roomRepository = RoomRepository();
  List<Room> rooms = [];
  RoomDetails room;

  RoomsProvider({id, type, index}) {
    if (id != null) {
      getActor(id, type, index);
    }
    getActors();
  }

  void getActors() {
    _roomRepository.fetchRooms().then((newRooms) {
      rooms.addAll(newRooms);
      notifyListeners();
    });
  }

  void getActor(id, type, index) {
    _roomRepository.fetchRoom(id, type, index).then((newRoom) {
      room = newRoom;
      notifyListeners();
    });
  }
}

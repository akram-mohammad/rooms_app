import 'package:flutter/material.dart';
import 'package:rooms_app/core/models/Room.dart';
import 'package:rooms_app/core/repositories/room_repository.dart';

class RoomsProvider extends ChangeNotifier {
  RoomRepository _roomRepository = RoomRepository();
  List<Room> rooms = [];

  RoomsProvider() {
    getActors();
  }

  void getActors() {
    _roomRepository.fetchRooms().then((newRooms) {
      rooms.addAll(newRooms);
      notifyListeners();
    });
  }
}

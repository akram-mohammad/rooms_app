import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rooms_app/core/providers/room_provider.dart';

class RoomsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RoomsProvider>(
      builder: (context, roomsProvider, _) {
        return roomsProvider.rooms.isNotEmpty
            ? Container(
                child: Text(roomsProvider.rooms[1].name),
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

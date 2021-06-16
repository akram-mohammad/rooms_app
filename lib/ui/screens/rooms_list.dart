import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rooms_app/core/models/Room.dart';
import 'package:rooms_app/core/providers/room_provider.dart';
import 'package:rooms_app/ui/widgets/room_item.dart';

class RoomsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RoomsProvider>(
      builder: (context, roomsProvider, _) {
        return roomsProvider.rooms.isNotEmpty
            ? ListView.builder(
                itemCount: roomsProvider.rooms.length,
                itemBuilder: (ctx, index) {
                  Room room = roomsProvider.rooms[index];
                  return RoomItem(
                    room: room,
                  );
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

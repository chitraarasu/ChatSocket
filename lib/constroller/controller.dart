import 'package:chatsocket/model/MessageModel.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Controller extends GetxController {
  late IO.Socket _socket;

  var messages = {};

  var adminChatList = [];

  createUser(userName) {
    _socket = IO.io(
      "http://localhost:3000",
      IO.OptionBuilder().setTransports(['websocket']).setQuery(
          {"username": userName}).build(),
    );
    _socket.onConnect((data) {
      print('connected');
      print(_socket.connected);
    });

    _socket.on("messageFromServer", (msg) {
      var key;

      if (msg["sender"] == "ADMIN") {
        key = msg["target"];
      } else {
        key = msg["sender"];
      }

      print(key);
      if (messages.containsKey(key)) {
        messages[key] = [
          msg,
          ...messages[key],
        ];
      } else {
        messages[key] = [
          msg,
        ];
        adminChatList.insert(0, key);
      }
      print(messages);
      update();
    });

    _socket.onConnectError((error) => print(error));
    _socket.onDisconnect((_) => print('disconnect'));
  }

  sendMessage(message) {
    _socket.emit("message", message);
  }
}

import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus {
  OnLine,
  OffLine,
  Connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;

  get serverStatus => _serverStatus;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    // Dart Client from: https://pub.dev/packages/socket_io_client
    Socket socket = io(
      'http://10.0.2.2:3000/',
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .enableAutoConnect() // disable auto-connection
          .build(),
    );
    socket.connect();
    socket.onConnect((_) {
      // print('connect');
      socket.emit('mensaje', 'Conectado desde flutter');
      _serverStatus = ServerStatus.OnLine;
      notifyListeners();
    });
    socket.onDisconnect((_) {
      _serverStatus = ServerStatus.OffLine;
      notifyListeners();
    });
  }
}

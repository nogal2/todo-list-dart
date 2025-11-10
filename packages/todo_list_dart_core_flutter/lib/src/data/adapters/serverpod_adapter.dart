import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:todo_list_dart_client/todo_list_dart_client.dart';

final String serverUrl = 'http://$localhost:8080/';

final Client client = Client(serverUrl)
  ..connectivityMonitor = FlutterConnectivityMonitor();

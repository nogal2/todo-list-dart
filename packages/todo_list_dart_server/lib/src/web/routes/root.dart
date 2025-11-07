import 'dart:io';

import 'package:serverpod/serverpod.dart';
import '../widgets/built_with_serverpod_page.dart';

class RouteRoot extends WidgetRoute {
  @override
  Future<Widget> build(Session session, HttpRequest request) async {
    return BuiltWithServerpodPage();
  }
}

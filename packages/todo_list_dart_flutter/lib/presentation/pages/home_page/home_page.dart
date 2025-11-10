import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'home_page_view_mobile.dart';
import 'home_page_view_web.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const HomePageViewWeb();
    } else {
      return const HomePageViewMobile();
    }
  }
}

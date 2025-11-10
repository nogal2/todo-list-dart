import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/pages.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
  ],
);

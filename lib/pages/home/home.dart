import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'home.g.dart';

@TypedGoRoute<HomeRoute>(path: '/', name: "home")
class HomeRoute extends GoRouteData with _$HomeRoute {
  @override
  String? redirect(BuildContext context, GoRouterState state) {
    return '/task/overview';
  }
}

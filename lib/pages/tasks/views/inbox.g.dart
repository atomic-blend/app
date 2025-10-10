// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $inboxRoute,
    ];

RouteBase get $inboxRoute => GoRouteData.$route(
      path: '/inbox',
      name: 'inbox',
      factory: _$InboxRoute._fromState,
    );

mixin _$InboxRoute on GoRouteData {
  static InboxRoute _fromState(GoRouterState state) => InboxRoute();

  @override
  String get location => GoRouteData.$location(
        '/inbox',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

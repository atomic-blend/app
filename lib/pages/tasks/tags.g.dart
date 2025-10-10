// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $tagsRoute,
    ];

RouteBase get $tagsRoute => GoRouteData.$route(
      path: '/tags',
      name: 'tags',
      factory: _$TagsRoute._fromState,
    );

mixin _$TagsRoute on GoRouteData {
  static TagsRoute _fromState(GoRouterState state) => TagsRoute();

  @override
  String get location => GoRouteData.$location(
        '/tags',
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

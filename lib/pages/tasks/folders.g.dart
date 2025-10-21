// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folders.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $foldersRoute,
    ];

RouteBase get $foldersRoute => GoRouteData.$route(
      path: '/folders',
      name: 'folders',
      factory: _$FoldersRoute._fromState,
    );

mixin _$FoldersRoute on GoRouteData {
  static FoldersRoute _fromState(GoRouterState state) => FoldersRoute();

  @override
  String get location => GoRouteData.$location(
        '/folders',
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

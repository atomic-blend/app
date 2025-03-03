enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'LifeOS - Dev';
      case Flavor.prod:
        return 'LifeOS';
      default:
        return 'title';
    }
  }

}

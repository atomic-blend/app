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
        return 'Atomic Blend - Dev';
      case Flavor.prod:
        return 'Atomic Blend';
      default:
        return 'title';
    }
  }

}

import 'dart:io' show Platform;


class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      //demo unit
      // return 'ca-app-pub-3940256099942544/6300978111';
      //real unit
      return 'ca-app-pub-4605622367477956/5973685361';
    }
    else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712";
    }
    else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917";
    }
    else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}


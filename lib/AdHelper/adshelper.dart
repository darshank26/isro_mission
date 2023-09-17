import 'dart:io';

class AdHelper {

  static String get  appOpenAd {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2180535035689124/8356855446';
    }  else {
      throw UnsupportedError('Unsupported platform');
    }
  }


  static String get bannerAdUnitIdOfHomeScreen {
    if (Platform.isAndroid) {
      return 'ca-app-pub-2180535035689124/9669937113';
    }  else {
      throw UnsupportedError('Unsupported platform');
    }
  }

}
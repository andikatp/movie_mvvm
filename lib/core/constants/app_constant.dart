class AppConstant {
  const AppConstant._();

  //network stuff
  static const String baseUrl = 'https://www.omdbapi.com/?apikey=';
  static const int successfulHttpGetStatusCode = 200;

  // key
  static const String tokenKey = 'userToken';

  // assets
  static const String networkErrorLottie = 'assets/json/network_error.json';
  static const String searchLottie = 'assets/json/search.json';
  static const String empty = 'assets/json/empty.json';
  static const String flowerLogo = 'assets/logo/flower.png';
  static const String logo = 'assets/logo/logo.png';
  static const String profile = 'assets/logo/profile.png';
  static const String emptySavedLottie = 'assets/json/empty_saved.json';

  // story
  static const story =
      'FlowerAdvisor came about as a result of a prominent absence of a '
      'single strong brand in Asia for International Flower Delivery. Online '
      'users found it a struggle to discover a trusted 24 hour delivery '
      'flower site which can be relied upon to send flowers, hampers and '
      'gifts to their loved ones anywhere in the world';

  static const story2 =
      'Although there are plenty of talented local florists, most '
      'are not keen to spend millions on infrastructure to build a stable and '
      'secure site that enables and manages E-commerce transaction. to make '
      'matters worse, Asia & Europe has also one of the largest E-commerce '
      'frauds which makes many users very skeptical of small sites.';
}

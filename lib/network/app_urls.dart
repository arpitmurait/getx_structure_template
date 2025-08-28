class AppUrls {
  static String baseUrl = 'https://expoza-admin.litesa.space';
  static String imageUrl = 'https://expoza-admin.litesa.space/storage/';

  static String login = '$baseUrl/api/login';
  static String register = '/api/signup';
  static String forgotPassword = '/api/forgot-password';
  static String verifyOtp = '/api/verify-otp';
  static String checkValidated = '/api/check-validated';
  static String sendOtp = '/api/send-otp';
  static String profile = '/api/profile';
  static String changeLanguage = '/api/profile/change-language';
  static String changePassword = '/api/profile/change-password';

  static String addresses = '/api/addresses';
  static String cities(countryId,stateId) => '/api/cities/$countryId/$stateId';
  static String states(countryId) => '/api/states/$countryId';
  static String countries = '/api/countries';

  static String contactSupport = '/api/contact-support';
  static String faqs = '/api/faqs';

  static String expoBanners(id) => '/api/expo-banners/$id';

  static String activeExpos = '/api/expos/active';
  static String upcomingExpos = '/api/expos/upcoming';
  static String bannerAds = '/api/banner-ads';
  static String expoVendors(String expoId) => '/api/expo-vendors/$expoId';
  static String expoFeaturedVendors(String expoId) => '/api/expo-featured-vendors/$expoId';
  static String expoProducts(String expoId, String vendorId) => '/api/expo-products/$expoId/$vendorId';
  static String expo6Products(String expoId) => '/api/expo-products/$expoId';
  static String expoDetails = '/api/expo-details';
  static String searchProducts = '/api/search/products';

  static String notifications = '/api/notifications';

  static String cart = '/api/cart';
  static String cartAdd = '/api/cart/add';
  static String cartUpdate(String id) => '/api/cart/update/$id';
  static String cartRemove(String id) => '/api/cart/remove/$id';
  static String cartClear = '/api/cart/clear';

  static String wishlistAll = '/api/all-wishlist';
  static String wishlist(page,perPage) => '/api/wishlist?page=$page&per_page=$perPage';
  static String wishlistAdd = '/api/wishlist';
  static String wishlistRemove(String id) => '/api/wishlist/remove/$id';

  static String orders(String status) => '/api/orders?status=$status';
  static String orderDetails(String id) => '/api/orders/$id';
  static String orderStatus(String id) => '/api/orders/$id/status';
  static String orderReviewStatus(String id) => '/api/orders/$id/items/review-status';
  static String orderRefund(String id) => '/api/orders/$id/refund';
  static String allOrders = '/api/all-orders';
  static String orderCancel(String id) => '/api/orders/cancel/$id';

  static String checkout = '/api/checkout';
  static String checkoutConfirm = '/api/checkout/confirm';

  static String productReviews(String productId) => '/api/reviews/product/$productId';
  static String similarProducts(String productId) => '/api/products/$productId/similar';
  static String reviews = '/api/reviews';
  static String reviewById(String id) => '/api/reviews/$id';

}
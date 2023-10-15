import 'dart:ui';

class ApiConstants {
  static String baseUrl = 'http://localhost:8080';
  static String dishesEndpoint = '/v1/dishes';
  static String usersEndpoint = '/v1/users';
  static String favoritesEndpoint = '/v1/favorites';
  static String ordersEndpoint = '/v1/orders';
}

class AppColors{
  static final Color beige = const Color(0xFFDACAA4);

}

class AppCardSize{
  static final double width = 0.40;
  static final double height = 0.20;
  static final double betweenCardWidth = 0.03;
}
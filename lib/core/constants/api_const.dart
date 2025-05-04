class ApiConstants {
  static const baseUrl = "https://dummyjson.com/";
  static const products = "products";
  static const login = "auth/login";
  static const categories = "products/categories";
  static const bestSeller = "products?sortBy=title&order=asc&limit=8&by=rating";
  static const userAddToCart = "carts/add";
  static const getCart = '/carts/user/{userId}';
  static const getUserInfo = 'auth/me';
  static const getProductInfo = 'products/{id}';
  static const getProductsByCategory = 'products/category/{category}';
  static const searchProduct = 'products/search';
  static const getUserById = 'users/{id}';

}

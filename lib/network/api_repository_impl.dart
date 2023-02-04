import 'dart:convert';

import 'package:http/http.dart' as http;

import '../repository/api_repository.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  static var client = http.Client();

  // static String mainUrl = "http://example.com/MultiVendor/api/MultivendorApi";
  static String mainUrl = "https://proactii.com/MultiVendor/api/MultivendorApi";
  static String countryMainUrl = "https://api.countrystatecity.in/v1";

  // final String secretKey = '12!@34#\$5%';
  // String secretKey = r'12!@34#$5%';

  var checkCustomerMobileEmailUrl = "$mainUrl/checkCustomerMobileEmail";
  var registerCustomerUrl = "$mainUrl/registerCustomer";
  var checkLoginUrl = "$mainUrl/checkLogin";
  var forgetPasswordUrl = "$mainUrl/forgetPassword";
  var customerProfileUrl = "$mainUrl/customerProfile";
  var updateCustomerProfileUrl = "$mainUrl/updateCustomerProfile";
  var updateCustomerPasswordUrl = "$mainUrl/updateCustomerPassword";
  var getAddressUrl = "$mainUrl/getAddress";
  var addAddressUrl = "$mainUrl/addAddress";
  var editAddressUrl = "$mainUrl/editAddress";
  var changeDeliveryAddressUrl = "$mainUrl/changeDeliveryAddress";
  var deleteAddressUrl = "$mainUrl/deleteAddress";
  var getCategoryUrl = "$mainUrl/getCategory";
  var getSliderUrl = "$mainUrl/getSlider";
  var allProductsUrl = "$mainUrl/allProducts";
  var getBrandUrl = "$mainUrl/getBrand";
  var brandProductUrl = "$mainUrl/brandProduct";
  var getAllBrandUrl = "$mainUrl/getAllBrand";
  var productDetailsUrl = "$mainUrl/productDetails";
  var getSimilarProductUrl = "$mainUrl/getSimilarProduct";
  var newProductUrl = "$mainUrl/newProduct";
  var bestSellerProductUrl = "$mainUrl/bestSellerProduct";
  var getRecentsearchkeywordsUrl = "$mainUrl/getRecentsearchkeywords";
  var getProductFilterColorUrl = "$mainUrl/getProductFilterColor";
  var getChildCategoryUrl = "$mainUrl/getChildCategory";
  var getProductFilterOptionUrl = "$mainUrl/getProductFilterOption";
  var getNewLaunchUrl = "$mainUrl/getNewLaunch";
  var getTrendingBrandsUrl = "$mainUrl/getTrendingBrands";
  var getProductByAttributeAndCategoryUrl = "$mainUrl/getProductByAttributeAndCategory";
  var getCategoryProductWithOffersUrl = "$mainUrl/getCategoryProductwithOffers";
  var searchBykeywordsUrl = "$mainUrl/searchBykeywords";
  var productSortByWithFilterUrl = "$mainUrl/productSortByWithFilter";
  var categoryProductUrl = "$mainUrl/categoryProduct";
  var getOfferWithCategoryListUrl = "$mainUrl/getOfferwithCategoryList";
  var getCartItemsUrl = "$mainUrl/getCartItems";
  var removeFromCartUrl = "$mainUrl/removeFromCart";
  var addToCartUrl = "$mainUrl/addToCart";
  var addToWishlistUrl = "$mainUrl/addToWishlist";
  var moveToWishlistUrl = "$mainUrl/moveToWishlist";
  var removeWishlistItemUrl = "$mainUrl/removeWishlistItem";
  var removeRecentSearchUrl = "$mainUrl/removeRecentSearch";
  var getWishlistItemUrl = "$mainUrl/getWishlistItem";
  var getFrequentSearchUrl = "$mainUrl/getFrequentSearch";
  var emptyCartUrl = "$mainUrl/emptyCart";
  var updateProductQtyUrl = "$mainUrl/updateProductQty";
  var addProductRatingReviewsUrl = "$mainUrl/addProductRatingReviews";
  var getProductFromVariantUrl = "$mainUrl/getProductFromVariant";
  var addOrderUrl = "$mainUrl/addOrder";
  var orderHistoryUrl = "$mainUrl/orderHistory";
  var searchInOrderUrl = "$mainUrl/searchInOrder";
  var getOrderByFilterUrl = "$mainUrl/getOrderByFilter";
  var orderDetailUrl = "$mainUrl/orderDetail";
  var getOrderInvoiceUrl = "$mainUrl/getOrderInvoice";
  var getCountryUrl = "$countryMainUrl/countries";


  static Uri getUrl(String endpoind, {String baseUrl = 'fakestoreapi.com'}) {
    var url = Uri.https('${(baseUrl)}', '${(endpoind)}', {'q': '{https}'});
    return url;
  }

  static Uri getMainUrl(String endpoind,
      {String baseUrl = 'onlinehatiya.herokuapp.com'}) {
    var url = Uri.https('${(baseUrl)}', '${(endpoind)}', {'q': '{https}'});
    return url;
  }

  static Map<String, String> header(String token) => {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };














}

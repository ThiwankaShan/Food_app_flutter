import 'package:auto_route/auto_route_annotations.dart';
import 'package:food_app_frontend/Screens/Customer/CustomerWrapper.dart';
import 'package:food_app_frontend/Screens/Customer/ItemDetails.dart';
import 'package:food_app_frontend/Screens/Customer/MenueList.dart';
import 'package:food_app_frontend/Screens/Customer/ShoppingCart.dart';

@autoRouter
class $Router {
  @initial
  CustomerWrapper customerWrapper;
  ShoppingCart shoppingCart;
  ItemDetails itemDetails;
  MenueList menueList;
}

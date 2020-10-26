import 'package:auto_route/auto_route_annotations.dart';
import 'package:food_app_frontend/Screens/Customer/CustomerHome.dart';
import 'package:food_app_frontend/Screens/Customer/ItemDetails.dart';
import 'package:food_app_frontend/Screens/Customer/MenueList.dart';
import 'package:food_app_frontend/Screens/Customer/ShoppingCart.dart';
import 'package:food_app_frontend/Screens/MainWrapper.dart';
import 'package:food_app_frontend/Screens/Vendor/NewItem.dart';

@autoRouter
class $Router {
  @initial
  MainWrapper mainWrapper;
  CustomerHome customerHome;
  ItemDetails itemDetails;
  MenueList menueList;
  ShoppingCart shoppingCart;
  NewItem newItem;
}

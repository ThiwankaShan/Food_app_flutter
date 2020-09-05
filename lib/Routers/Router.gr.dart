// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:food_app_frontend/Screens/MainWrapper.dart';
import 'package:food_app_frontend/Screens/Customer/CustomerHome.dart';
import 'package:food_app_frontend/Screens/Customer/ItemDetails.dart';
import 'package:food_app_frontend/Screens/Customer/MenueList.dart';
import 'package:food_app_frontend/Screens/Customer/ShoppingCart.dart';

class Router {
  static const mainWrapper = '/';
  static const customerHome = '/customer-home';
  static const itemDetails = '/item-details';
  static const menueList = '/menue-list';
  static const shoppingCart = '/shopping-cart';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.mainWrapper:
        return MaterialPageRoute(
          builder: (_) => MainWrapper(),
          settings: settings,
        );
      case Router.customerHome:
        return MaterialPageRoute(
          builder: (_) => CustomerHome(),
          settings: settings,
        );
      case Router.itemDetails:
        if (hasInvalidArgs<ItemDetailsArguments>(args)) {
          return misTypedArgsRoute<ItemDetailsArguments>(args);
        }
        final typedArgs =
            args as ItemDetailsArguments ?? ItemDetailsArguments();
        return MaterialPageRoute(
          builder: (_) => ItemDetails(
            itemID: typedArgs.itemID,
          ),
          settings: settings,
        );
      case Router.menueList:
        if (hasInvalidArgs<MenueListArguments>(args)) {
          return misTypedArgsRoute<MenueListArguments>(args);
        }
        final typedArgs = args as MenueListArguments ?? MenueListArguments();
        return MaterialPageRoute(
          builder: (_) => MenueList(shopID: typedArgs.shopID),
          settings: settings,
        );
      case Router.shoppingCart:
        return MaterialPageRoute(
          builder: (_) => ShoppingCart(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

class MenueListArguments {
  var shopID;
  MenueListArguments({this.shopID});
}

class ItemDetailsArguments {
  var itemID;
  ItemDetailsArguments({this.itemID});
}

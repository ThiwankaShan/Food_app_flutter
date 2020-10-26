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
import 'package:food_app_frontend/Screens/Vendor/NewItem.dart';

class Router {
  static const mainWrapper = '/';
  static const customerHome = '/customer-home';
  static const itemDetails = '/item-details';
  static const menueList = '/menue-list';
  static const shoppingCart = '/shopping-cart';
  static const newItem = '/new-item';
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
            user: typedArgs.user,
            item: typedArgs.item,
            shopID: typedArgs.shopID,
            shopName: typedArgs.shopName,
            cart: typedArgs.cart,
          ),
          settings: settings,
        );

      case Router.menueList:
        if (hasInvalidArgs<MenueListArguments>(args)) {
          return misTypedArgsRoute<MenueListArguments>(args);
        }
        final typedArgs = args as MenueListArguments ?? MenueListArguments();
        return MaterialPageRoute(
          builder: (_) => MenueList(
              user: typedArgs.user,
              shopID: typedArgs.shopID,
              shopName: typedArgs.shopName,
              cart: typedArgs.cart),
          settings: settings,
        );

      case Router.shoppingCart:
        if (hasInvalidArgs<ShoppingCartArguments>(args)) {
          return misTypedArgsRoute<ShoppingCartArguments>(args);
        }
        final typedArgs =
            args as ShoppingCartArguments ?? ShoppingCartArguments();
        return MaterialPageRoute(
          builder: (_) => ShoppingCart(cart: typedArgs.cart),
          settings: settings,
        );

      case Router.newItem:
        if (hasInvalidArgs<NewItemArguments>(args)) {
          return misTypedArgsRoute<NewItemArguments>(args);
        }
        final typedArgs = args as NewItemArguments ?? NewItemArguments();
        return MaterialPageRoute(
          builder: (_) => NewItem(
            user: typedArgs.user,
          ),
          settings: settings,
        );

      default:
        return unknownRoutePage(settings.name);
    }
  }
}

class MenueListArguments {
  var shopID;
  var shopName;
  var cart;
  var user;
  MenueListArguments({this.shopID, this.cart, this.shopName, this.user});
}

class ItemDetailsArguments {
  var item;
  var shopID;
  var shopName;
  var cart;
  var user;
  ItemDetailsArguments(
      {this.item, this.shopID, this.cart, this.shopName, this.user});
}

class ShoppingCartArguments {
  var cart;
  ShoppingCartArguments({this.cart});
}

class NewItemArguments {
  var user;
  NewItemArguments({this.user});
}

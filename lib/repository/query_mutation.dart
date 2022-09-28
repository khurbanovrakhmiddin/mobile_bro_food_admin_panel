import 'dart:math';

import 'package:mobile_bro_food_admin_panel/model/food_model.dart';

class QueryMutation {
  String menuList() {
    return """
query GetMenu {
  menu(order_by: {type: asc, about: asc, have: asc, image: asc, name: asc, price: asc}) {
    id
    about
    have
    image
    name
    price
    type
  }
}
   """;
  }

  String insertMenu({

    required String name,
    required String image,
    required String price,
    required String about,
    required bool have,
    required String id,
    required String type
}) {

    return """
 mutation CreateMenu {
  insert_menu_one(object: {type: "$type", about: "$about", have: 
  "$have", 
  image:
   "$image", name: "$name", price: "$price", id: "$id"}) {
    about
    have
    id
    image
    name
    price
    type
  }
}
    """;
  }

  String updateMenu(
      {required String name,
      required String image,
      required String price,
      required String about,
      required bool have,
      required String id,
      required String type}) {
    return """
   mutation CreateMenu {
  update_menu(_set: {about: "$about", have: "$have", id: "$id", 
  image: "$image", 
  name: "$name", price: "$price", type: "$type"}, where: {id: {_eq:
   "$id"}}) {
    returning {
      about
      have
      id
      image
      name
      price
      type
    }
  }
}
    """;
  } String menuDelete(
      {
      required String id}) {
    
    
    return """
   mutation DeleteMenu {
  delete_menu(where: {id: {_eq: "$id"}}) {
    affected_rows
  }
}
    """;
  }


}

import 'dart:math';

class QueryMutation {
  String menuList(int page) {
    return """
    
query MyQuery {
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

  String insertMenu(String name,int id) {
    return """
 mutation MyMutation {
  insert_menu_one(object: {id:$id,name:$name,type: "burgers",
        about: "about",have: true,price: "123123", image: "https://www.santamariaworld.com/optimized/maximum/globalassets/_recipes/bbq/kentucky_burger.jpg"}) {
    about
    id
    have
    image
    name
    price
    type
  }
}
    """;
  }
}

class CatalogModel {
    
    List<Item> get items => [
         Item(name:'Apple', unitPrice: 1.55),
         Item(name:'Orange', unitPrice: 1.2),
         Item(name:'Banana', unitPrice: .55),
    ];

}

class Item {
  Item({this.name, this.unitPrice});
  String name;
  double unitPrice;
  int quantities= 1 ;
}

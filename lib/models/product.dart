class Product {
  int id;
  var title;
  var price;
  var description;
  var image;

  Product(
      {required this.id,
      required this.description,
      required this.title,
      required this.image,
      required this.price});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(

        id: json['id'],
       title : json[' title'],
        description: json['description'],
        image: json['image'],
        price:json['price']
    );



}}

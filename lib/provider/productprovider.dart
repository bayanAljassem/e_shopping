import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;

import '../models/product.dart';


class ProductProvider with ChangeNotifier{

  List product2=[];
  Map product={};
  List carts=[];
  List myproduct=[];
  double width = 150.0;
  double hight = 200.0;


  Future<void> fetchProduct() async {
    final response = await http.get(Uri.parse('http://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> productJson = json.decode(response.body);
        print(productJson);
        product2=productJson;
      notifyListeners(); // Notify widgets listening to this provider
    } else {
      throw Exception('Failed to load posts');
    }
  }
  Future<void> getProduct(int id ) async {
    final response = await http.get(Uri.parse('http://fakestoreapi.com/products/$id'));

    if (response.statusCode == 200) {
     var chproductJson = json.decode(response.body);

     product=chproductJson;
     print(product);
      notifyListeners(); // Notify widgets listening to this provider
    } else {
      throw Exception('Failed to load posts');
    }
   print('l');
  }


  Future<void> getcart(int userid) async {
    final response = await http.get(Uri.parse('http://fakestoreapi.com/carts'));

    if (response.statusCode == 200) {
      var cartproductJson = json.decode(response.body);

      carts=cartproductJson;
      print(carts);
      carts=carts.where((e) => e['userId']==userid).toList();

      notifyListeners(); // Notify widgets listening to this provider
    } else {
      throw Exception('Failed to load carts');
    }
    print('l');
  }

  List getcartProduct(int id )  {
   myproduct =product2.where((e) => e['id']==id ).toList();
return myproduct;
    // Notify widgets listening to this provider

  }
  void searchProduct(String title){
  product2=product2.where((e) => e['title'].contains(title)).toList();
 notifyListeners();
  }








}
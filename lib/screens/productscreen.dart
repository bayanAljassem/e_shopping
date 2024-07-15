import 'package:e_shoping/widget/imagefromurl.dart';
import 'package:flutter/material.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../provider/productprovider.dart';

import '../widget/containerbottommodel.dart';

class ProductScreen extends StatelessWidget {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Product Overview'),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
      if (productProvider.product.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }
           return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(


                  child:Container(
                    width: 300,
                    height: 400,


                    child: Image.network(
                      productProvider.product['image'],
                      fit: BoxFit.fill,
                    ),

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/1.7,
                          child: Text(
                            productProvider.product['title'],
                            style: TextStyle(

                                color: Colors.black87,
                                fontWeight: FontWeight.w900,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                      ],
                    ),
                    Text(
                      '\$300.00',
                      style: TextStyle(
                          color: AppColor.primaycolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RatingBar.builder(
                    initialRating: productProvider.product['rating']['rate'],
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 25,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    productProvider.product['description'],
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Color(0x1f989797),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child: Icon(
                          Icons.shopping_cart,
                          color:AppColor.primaycolor,
                        ),
                      ),
                    ),
                    ContainerBottonModel(itext: "Buy Now",bgColor: AppColor.primaycolor,containerWidth: 200,)
                  ],
                ),
              ],
            );}
          ),
        )),
      ),
    );
  }
}

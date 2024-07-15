import 'package:e_shoping/colors.dart';
import 'package:e_shoping/screens/productscreen.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/productprovider.dart';
import '../widget/imagefromurl.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).fetchProduct();
    Provider.of<ProductProvider>(context, listen: false).getcart(1);


    super.initState();
  }

  TextEditingController _textFieldSearchController = TextEditingController();

  List<String> images = [
    'assets/images/Annotation 2024-07-08 173811.jpg',
    'assets/images/Annotation 2024-07-08 171953.jpg',
    'assets/images/Annotation 2024-07-08 172248.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: SingleChildScrollView(
            child: Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
              if (productProvider.product2.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        height: 50,
                        width: MediaQuery.of(context).size.width /1.1,
                        decoration: BoxDecoration(
                          color: Colors.black12.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black12.withOpacity(0.05),
                          //     blurRadius: 1,
                          //      spreadRadius: 2
                          //   )
                          //  ]
                        ),
                        child: TextFormField(
                          controller: _textFieldSearchController,
                          decoration: InputDecoration(
                              prefixIcon: InkWell(
                                onTap: (){
                                  Provider.of<ProductProvider>(context, listen: false).searchProduct(_textFieldSearchController.text);
                                },
                                child: Icon(
                                  Icons.search,
                                  color:AppColor.primaycolor,
                                ),
                              ),
                              border: InputBorder.none,
                              hintText: 'Find your product',
                              hintStyle: TextStyle()),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    child: FanCarouselImageSlider(
                      sliderHeight: 210,

                      autoPlay: true,
                      imagesLink: images,
                      isAssets: true,


                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Availabe Products',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GridView.builder(
                    itemCount: productProvider.product2.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.56,
                        crossAxisSpacing: 7,
                        mainAxisSpacing: 4),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.only(right: 15, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 150,
                              child: InkWell(
                                onTap: () {
                                  Provider.of<ProductProvider>(context,
                                          listen: false)
                                      .getProduct(productProvider
                                          .product2[index]['id']);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductScreen()));
                                },
                                child: ClipRRect(
                                  child: ImageFromUrl(
                                      productProvider.product2[index]['image']),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                productProvider.product2[index]['title'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 22,
                                ),
                                Text(
                                  productProvider.product2[index]['rating']
                                          ['rate']
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 17),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "\$${productProvider.product2[index]['price'].toString()}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

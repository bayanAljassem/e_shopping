import 'package:e_shoping/colors.dart';
import 'package:e_shoping/provider/productprovider.dart';
import 'package:e_shoping/widget/containerbottommodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List carts = context.watch<ProductProvider>().carts;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
            'Cart',
            style: TextStyle(color: AppColor.primaycolor, fontSize: 20),
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          flexibleSpace: Container(
              decoration: BoxDecoration(
            // تعريف الـ Gradient هنا
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(157, 131, 160, 0.2),
                Color.fromRGBO(118, 140, 220, 0.1),
              ],
            ),
          ))),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            // تعريف الـ Gradient هنا
            gradient: LinearGradient(colors: [
              Color.fromRGBO(157, 131, 160, 0.2),
              Color.fromRGBO(118, 140, 220, 0.1),
            ]),
          ),
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: carts.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index2) {
                    String dateString = carts[index2]['date'];
                    DateTime dateTime = DateTime.parse(dateString);
                    DateTime dateOnly =
                        DateTime(dateTime.year, dateTime.month, dateTime.day);
                    return Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ' Cart${index2 + 1}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black87),
                              ),
                              Text(
                                dateOnly.toString(),
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.pink),
                              ),
                            ],
                          ),
                          ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                List myprod = Provider.of<ProductProvider>(
                                        context,
                                        listen: false)
                                    .getcartProduct(carts[index2]['products']
                                        [index]['productId']);

                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Checkbox(
                                          splashRadius: 20,
                                          activeColor: AppColor.primaycolor,
                                          value: true,
                                          onChanged: (val) {}),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          myprod[0]['image'],
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              myprod[0]['title'],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.black87),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '\$ ${myprod[0]['price']}',
                                              style: TextStyle(
                                                  color: Colors.pink,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(CupertinoIcons.minus),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            '${carts[index2]['products'][index]['quantity']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            CupertinoIcons.plus,
                                            color: Colors.red,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: ContainerBottonModel(
                        bgColor: AppColor.primaycolor, itext: 'Buy Now')),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

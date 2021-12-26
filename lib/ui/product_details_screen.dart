import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/const/AppColor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  var _product;
  ProductDetails(this._product);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Future addToCart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users-cart-items");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
      "name": widget._product["product-name"],
      "price": widget._product["product-price"],
      "image": widget._product["product-img"],
    }).then((value) => print("Add to cart"));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 3.5,
            child: CarouselSlider(
              items: widget._product["product-img"]
                  .map<Widget>((item) => Padding(
                        padding: const EdgeInsets.only(left: 3, right: 3),
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(item),
                                    fit: BoxFit.fitWidth))),
                      ))
                  .toList(),
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (val, carouselPageChangedReason) {
                    setState(() {});
                  }),
            ),
          ),
          Text(widget._product['product-name']),
          Text(widget._product['product-description']),
          Text(widget._product['product-price'].toString()),
          SizedBox(
            width: 1.sw,
            height: 56.w,
            child: ElevatedButton(
              onPressed: () => addToCart(),
              child: Text(
                "Add To Cart",
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
              ),
              style: ElevatedButton.styleFrom(
                  primary: AppColors.deep_orange, elevation: 3),
            ),
          ),
        ],
      )),
    );
  }
}

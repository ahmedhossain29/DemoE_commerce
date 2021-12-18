import 'package:carousel_slider/carousel_slider.dart';
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
            height: 150.h,
            width: ScreenUtil().screenWidth,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.light,
                      color: Colors.transparent,
                    ),
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(fontSize: 22.sp, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

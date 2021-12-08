import 'package:e_commerce/const/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  TextEditingController _searchController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60.h,
                      child: TextFormField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: "Search Product Here",
                          hintStyle: TextStyle(fontSize: 15.sp),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      color: AppColors.deep_orange,
                      height: 60.h,
                      width: 60.h,
                      child: Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
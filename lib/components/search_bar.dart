import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constant.dart';


class SearchBar extends StatelessWidget {
  final double width;
  final double height;

  const SearchBar({required this.width, required this.height});


  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
         vertical: 20.w),
        child: Container(
         width: width,
         height: kSpacingUnit.w * 5.5, 
        decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: kGreyDarker!,
                    blurRadius: 2.0,
                    offset: const Offset(0.0, 2.0),
                  ),
                ],
              ),
          child: Row(
            children: 
              <Widget>[
                Container(
                  width: kSpacingUnit.w * 5.4,
                  height: kSpacingUnit.w * 5.5,
                  decoration: BoxDecoration(
                        color: kGrey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )),
                        child: IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {},
                          color: kGreyDarker,
                        ),
                ),
                Expanded(
                  child: Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      textAlign: TextAlign.left,
                      cursorColor: Colors.black87,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: kGreyDarker,
                          fontSize:kSpacingUnit.w * 1.5,
                        ),
                      )
                    ),
                  )
                )
            ],
          )
        ),
      ),
     ),
   );
  }}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grab_ui_clone/components/constant.dart';

class AdvertColumn extends StatelessWidget {
  const AdvertColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 26,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/mcd.jpg'),
                  ),
                ),
                // Padding(padding: const EdgeInsets.fromLTRB())
                Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0, 0),
                  child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                              fontSize: kSpacingUnit.w * 1.4,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                )
              ],
            ),
            SizedBox(height: kSpacingUnit.w * 1),
            Text(
              'Get McDonald Big Mac Now at 40% Off',
              style: TextStyle(
                fontSize: kSpacingUnit.w * 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: kSpacingUnit.w * 0.3),
            Text(
              'Not Sponsored by McDonald',
              style: TextStyle(
                fontSize: kSpacingUnit.w * 1.2,
                color: Colors.grey[600],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grab_ui_clone/components/constant.dart';

class GrabHighlight extends StatelessWidget {
  const GrabHighlight({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: kSpacingUnit.w * 20,
        // color: Colors.white,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/ads5.jpg')
              ),
            ),
            Opacity(opacity: 0.1,
            child: Container(
              color: kGrey,
            )),
            Positioned(
              bottom: 0,
              left: 0,
              child: Padding(padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0, 10.0),
              child: Row(
                children: [
                  Icon(Icons.campaign_outlined,
                  color:  kGreyDarker,
                  size: kSpacingUnit.w * 2.2,),
                  SizedBox(width: kSpacingUnit.w * 0.5,),
                  Text('Grab Highlight', style: TextStyle(
                          fontSize: kSpacingUnit.w * 1.3,
                          color: kGreyDarker,
                        ),)
                ],
              ),),
            )
          ],
        ),
      ),
    );
  }
}
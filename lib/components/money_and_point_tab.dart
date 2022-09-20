import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grab_ui_clone/components/constant.dart';

class MoneyAndPointTab extends StatelessWidget {
  final String image;
  final String text;
  final bool isPrice;

  const MoneyAndPointTab(
      {required this.image, required this.text, this.isPrice = true});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: kSpacingUnit.w * 3,
            height: kSpacingUnit.w * 3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: kGreyDarker!,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                child: Image(image: AssetImage(image)),
              ),
            ),
          ),
          SizedBox(
            width: kSpacingUnit.w * 0.6,
          ),
          isPrice
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text('RM',
                      style: TextStyle(
                          fontSize: kSpacingUnit.w * 1, color: kGreyDarker)))
              : const SizedBox.shrink(),
          isPrice
              ? SizedBox(
                  width: kSpacingUnit.w * 0.2,
                )
              : const SizedBox.shrink(),
          Text(
            text, style: TextStyle(fontSize: kSpacingUnit.w * 1.4,
            fontWeight: FontWeight.w400)
          ),
          Icon(Icons.arrow_forward_ios_outlined,
          size: kSpacingUnit.w * 1.4,
          color: kGreyDarker,)
        ],
      ),
    ));
  }
}

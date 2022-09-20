import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grab_ui_clone/components/constant.dart';

class GridMenuView extends StatelessWidget {
  const GridMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> gridList = [
      {'image': 'assets/grids/car.png', 'label': 'Car'},
      {'image': 'assets/grids/food.png', 'label': 'Food'},
      {'image': 'assets/grids/grocery.png', 'label': 'Mart'},
      {'image': 'assets/grids/delivery.png', 'label': 'Express'},
      {'image': 'assets/grids/prepaid.png', 'label': 'Prepaid'},
      {'image': 'assets/grids/insurance.png', 'label': 'Insurance'},
      {'image': 'assets/grids/present.png', 'label': 'Gift Cards'},
      {'image': 'assets/grids/more.png', 'label': 'More'},
    ];
    return Expanded(
      child: Container(
        color: Colors.white,
        child: GridView.builder(
            physics: const ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: kSpacingUnit.w * 1,
            ),
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
            shrinkWrap: true,
            itemCount: gridList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: kSpacingUnit.w * 6,
                        height: kSpacingUnit.w * 6,
                        decoration: BoxDecoration(
                          color: kLightGreen,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Image(
                          fit: BoxFit.contain,
                          width: kSpacingUnit.w * 3.8,
                          height: kSpacingUnit.w * 3.8,
                          image: AssetImage(gridList[index]['image']!)),
                    ],
                  ),
                  SizedBox(height: kSpacingUnit.w * 0.7),
                  Flexible(
                    child: Text(
                      gridList[index]['label']!,
                      style: TextStyle(fontSize: kSpacingUnit.w * 1.4),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

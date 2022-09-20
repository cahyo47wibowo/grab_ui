import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grab_ui_clone/components/advert_column.dart';
import 'package:grab_ui_clone/components/grab_highlight.dart';
import 'package:grab_ui_clone/components/grid_view.dart';
import 'package:grab_ui_clone/components/money_and_point_tab.dart';
import 'package:grab_ui_clone/components/promo_grid_view.dart';
import 'package:grab_ui_clone/components/top_up_bar.dart';

import 'components/constant.dart';
import 'components/search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);
  // final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController? _scrollController;
  bool _isVisible = true;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _isVisible = true;

    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController?.position.userScrollDirection ==
            ScrollDirection.reverse) {
          setState(() {
            _isVisible = false;
          });
        } else if (_scrollController?.position.userScrollDirection ==
            ScrollDirection.forward) {
          setState(() => _isVisible = true);
        }
      });
  }

  Future<void> _fetchData() async {}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      body: RefreshIndicator(
        displacement: 100.0,
        color: kGreen,
        onRefresh: () => _fetchData(),
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              toolbarHeight: kSpacingUnit.w * 0.0,
              collapsedHeight: kSpacingUnit.w * 0.1,
              pinned: true,
              stretch: true,
              backgroundColor: kLightGreen,
              elevation: 0.0,
              expandedHeight: kSpacingUnit * 8.5,
              flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: kGreen,
                    ),
                  ),
                  SearchBar(width: width, height: height)
                ],
              )),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                height: kSpacingUnit.w * 6,
                color: Colors.white,
                child: Row(children: [
                  const MoneyAndPointTab(
                      image: 'assets/grab.png', text: '9.90'),
                  Container(
                    color: kGrey,
                    width: kSpacingUnit.w * 0.2,
                  ),
                  const MoneyAndPointTab(
                      image: 'assets/crown.png',
                      text: '401 Points',
                      isPrice: false)
                ]),
              ),
              Divider(
                color: Colors.transparent,
                height: kSpacingUnit.w * 0.5,
              ),
              Container(
                height: kSpacingUnit.w * 27,
                color: Colors.white,
                child: Column(children: [
                  TopUpBar(width: width),
                  const GridMenuView(),
                ]),
              ),
              Divider(
                color: Colors.transparent,
                height: kSpacingUnit.w * 0.5,
              ),
              const AdvertColumn(),
              const PromoGridView(),
              const GrabHighlight()
            ]))
          ],
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
          curve: Curves.easeInOutQuad,
          duration: const Duration(milliseconds: 700),
          height: _isVisible ? kSpacingUnit * 7 : 0.0,
          child: Wrap(
            children: [
              Container(
                color: kGreen,
                child: BottomNavigationBar(
                  backgroundColor: kLightGreen,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  type: BottomNavigationBarType.fixed,
                  elevation: 10,
                  currentIndex: _selectedIndex,
                  items: [
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Home"),
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.local_activity_outlined),
                      label: 'Activity',
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.payment_outlined),
                      label: 'Payment',
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.message_outlined),
                      label: 'Messages',
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Account',
                    ),
                  ],
                  selectedItemColor: kGreen,
                  unselectedItemColor: Colors.grey[600],
                ),
              )
            ],
          )),
    );
  }
}

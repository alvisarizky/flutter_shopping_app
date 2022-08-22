import 'package:flutter/material.dart';
import 'package:flutter_360_rotation_shopping_app/data/datas.dart';
import 'package:flutter_360_rotation_shopping_app/screens/detail_screen.dart';
import 'package:flutter_360_rotation_shopping_app/themes/colors.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> buildCategories() {
    return Data.generateCategories()
        .map(
          (e) => Container(
            padding: EdgeInsets.only(
              left: 15,
              bottom: 10,
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        color: ColorPalette.myBlack,
                        child: Image.asset(e.image),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      e.title,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    e.id == 1 ? Colors.white : ColorPalette.myBlack),
                backgroundColor: MaterialStateProperty.all<Color>(
                    e.id == 1 ? ColorPalette.myOrange : Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset('assets/ic_menu.png'),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Image.asset('assets/ic_search.png'),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.asset('assets/img_banner.png'),
                  borderRadius: BorderRadius.circular(16),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'New Release',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Nike Air\nMax 90',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Buy Now'.toUpperCase(),
                        ),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              ColorPalette.myBlack),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: buildCategories(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: RichText(
              text: TextSpan(
                text: 'New Men\'s',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.all(5),
            children: Data.generateProducts()
                .map(
                  (e) => Card(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              child: DetailScreen(),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              e.image,
                              height: 90,
                              width: double.infinity,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                text: e.type,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorPalette.myOrange,
                                ),
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                text: e.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: '\$ ${e.price}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Spacer(),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.add_rounded,
                                    color: Colors.white,
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black87),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalette.myOrange,
        onPressed: () {},
        child: Container(
          margin: EdgeInsets.all(15),
          child: Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
        ),
        elevation: 4,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/ic_shop.png'),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/ic_wishlist.png'),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/ic_notif.png'),
            ),
            SizedBox(
              width: 2,
            ),
          ],
        ),
      ),
    );
  }
}

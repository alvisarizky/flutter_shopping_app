import 'package:flutter/material.dart';
import 'package:flutter_360_rotation_shopping_app/data/datas.dart';
import 'package:flutter_360_rotation_shopping_app/themes/colors.dart';
import 'package:imageview360/imageview360.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<ImageProvider> imageList = [];
  bool autoRotate = false;
  int rotationCount = 22;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;

  @override
  void initState() {
    updateImageList(context);
    super.initState();
  }

  List<Widget> buildColorWidget() {
    return Data.generateCategories()
        .map(
          (e) => Container(
            padding: EdgeInsets.only(
              left: 5,
              bottom: 10,
              top: 15,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: e.id == 1 ? ColorPalette.myOrange : Colors.white,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  e.image,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  void updateImageList(BuildContext context) {
    for (int i = 1; i <= 22; i++) {
      imageList.add(AssetImage('assets/s$i.png'));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Men\'s Shoes',
          style: TextStyle(
            color: ColorPalette.myOrange,
          ),
        ),
        elevation: 0,
        actions: [
          Image.asset('assets/ic_search.png'),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: size.width - 30,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 70,
                        ),
                        child: Image.asset(
                          'assets/ring.png',
                        ),
                      ),
                    ),
                    ImageView360(
                      key: UniqueKey(),
                      autoRotate: autoRotate,
                      rotationCount: rotationCount,
                      swipeSensitivity: swipeSensitivity,
                      allowSwipeToRotate: allowSwipeToRotate,
                      imageList: imageList,
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: ColorPalette.grayBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Nike Air Max Pre-Day',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '5.0',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '(1125 Review)',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                              ),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text:
                              'Men\'s sneakers are made with leather upper features for durability and support, while perforations provide airflow during every shoe wear.',
                          style: TextStyle(
                            color: Colors.black45,
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
                          text: 'Select Color',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: buildColorWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tip_calculator/core/SlideDots.dart';
import 'package:tip_calculator/palette.dart';

import '../Slide.dart';
import 'custom_app_bar.dart';

class HomeScreenItems extends StatefulWidget {
  @override
  _HomeScreenItemsState createState() => _HomeScreenItemsState();
}

class _HomeScreenItemsState extends State<HomeScreenItems> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _header(size.height),
          _overView(size.height),
          _buildYourOwnTest(size.height),
          _carousalSlider(),
          _dotSlider(),
          _reviewList(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _header(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tip Calculator",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Are you feeling sick?",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "If you feel sick with any covid symptoms, please call or text us immidiately.",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _overView(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Overview",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      "assets/images/piechart.png",
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      "Tip Calculator",
                      style: TextStyle(color: const Color(0xFF40B7A9)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/debit.png",
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      "Bill Payment ",
                      style: TextStyle(color: const Color(0xFF40B7A9)),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      "assets/images/chat.png",
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      "Chat Room",
                      style: TextStyle(color: const Color(0xFF40B7A9)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/debit.png",
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      "Bill Payment ",
                      style: TextStyle(color: const Color(0xFF40B7A9)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset('assets/images/debit.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Do your own test!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Follow the instructions\nto do your own test.',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _carousalSlider() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(10),
        child: FutureBuilder(
          future: _getList(),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Text('${snapshot.error}'),
              );
            else if (snapshot.hasData) {
              var newsList = snapshot.data as List<Slide>;
              var sliderList = newsList != null
                  ? newsList.length > 10
                      ? newsList.getRange(0, 10).toList()
                      : newsList.take(newsList.length).toList()
                  : [];
              var contentList = newsList != null
                  ? newsList.length > 10
                      ? newsList.getRange(11, newsList.length - 1).toList()
                      : []
                  : [];
              return SafeArea(
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.8),
                      items: sliderList.map(
                        (item) {
                          return Builder(
                            builder: (context) {
                              return GestureDetector(
                                onTap: null,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        '${item.imageUrl}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              );
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter _dotSlider() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            height: 120,
            margin: const EdgeInsets.all(10.0),
            child: PageView.builder(
                onPageChanged: _onPageChanged,
                controller: _pageController,
                itemCount: slideList.length,
                itemBuilder: (context, index) {
                  return _dotSliderItems(index);
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < slideList.length; i++)
                i == _currentPage ? SlideDots(true) : SlideDots(false),
            ],
          )
        ],
      ),
    );
  }

  SliverToBoxAdapter _reviewList() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(10.0),
        height: 180,
        child: ListView.builder(
          shrinkWrap: true,
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: slideList.length,
          itemBuilder: (context, index) {
            return _reviewListItems(index);
          },
        ),
      ),
    );
  }

  Widget _dotSliderItems(int index) {
    return Center(
      child: Container(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              slideList[index].imageUrl,
              width: 120,
              height: 100,
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      slideList[index].title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      slideList[index].description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _reviewListItems(int index) {
    return Row(
      children: [
        Container(
          height: 155,
          width: 250,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    color: (Colors.grey[200])!,
                    spreadRadius: 2.0,
                    blurRadius: 2.0,
                    offset: Offset.fromDirection(10))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                slideList[index].title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text("Chuadanga (chuadanga)",
                  style: TextStyle(color: Colors.blue)),
              SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: (Colors.yellow[700])!,
                    size: 18,
                  ),
                  Icon(
                    Icons.star,
                    color: (Colors.yellow[700])!,
                    size: 18,
                  ),
                  Icon(
                    Icons.star,
                    color: (Colors.yellow[700])!,
                    size: 18,
                  ),
                  Icon(
                    Icons.star,
                    color: (Colors.yellow[700])!,
                    size: 18,
                  ),
                  Icon(
                    Icons.star,
                    color: (Colors.yellow[700])!,
                    size: 18,
                  ),
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                slideList[index].description,
                maxLines: 3,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10.0,
        )
      ],
    );
  }

  Future<List<Slide>> _getList() {
    return Future.value([
      Slide(
        imageUrl:
            'https://i.pinimg.com/originals/f8/1d/b1/f81db1d74e0b1ed5b0f19ed409910a5a.jpg',
        title: 'A Cool Way to Get Start',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
      ),
      Slide(
        imageUrl: 'https://wallpapercave.com/wp/dMugrrP.jpg',
        title: 'Design Interactive App UI',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
      ),
      Slide(
        imageUrl:
            'https://images.unsplash.com/photo-1516918656725-e9b3ae9ee7a4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8aGklMjByZXNvbHV0aW9ufGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80',
        title: 'It\'s Just the Beginning',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
      ),
      Slide(
        imageUrl:
            'https://wonderfulengineering.com/wp-content/uploads/2014/03/high-resolution-wallpapers-12.jpg',
        title: 'It\'s Just the Beginning',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
      )
    ]);
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tip_calculator/SlideItem.dart';
import 'package:tip_calculator/core/SlideDots.dart';
import 'package:tip_calculator/features/appbar_widget.dart';

import '../Slide.dart';


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
        appBar: appBarMain(context, "Tip Calculator"),
        body:SingleChildScrollView(
        child: Column(
        children: <Widget>[
           Container(
               margin: EdgeInsets.all(10) ,
               child: FutureBuilder
                 (
                   future: _getList(),
                   builder: (context, snapshot)
                   {
                     if (snapshot.hasError)
                       return Center(child: Text('${snapshot.error}'),);
                     else if (snapshot.hasData) {
                       var newsList = snapshot.data as List<Slide>;
                       var sliderList = newsList != null ?
                       newsList.length > 10 ?
                       newsList.getRange(0, 10).toList()
                           : newsList.take(newsList.length)
                           .toList()
                           : [];
                       var contentList = newsList != null ?
                       newsList.length > 10 ?
                       newsList.getRange(11, newsList.length - 1)
                           .toList()
                           : []
                           : [];
                       return SafeArea(
                           child: Column(
                             children: [
                               CarouselSlider(
                                 options: CarouselOptions(
                                     aspectRatio: 16/9,
                                     autoPlay: true,
                                     enlargeCenterPage: true,
                                     viewportFraction: 0.8
                                 ),
                                 items: sliderList.map((item)
                                 {
                                   return Builder(
                                     builder: (context) {
                                       return GestureDetector(
                                         onTap: null, child: Stack(children: [
                                         ClipRRect(
                                           borderRadius: BorderRadius.circular(8),
                                           child: Image.network('${item.imageUrl}',
                                             fit: BoxFit.cover,
                                           ),
                                         ),
                                       ],),);
                                     },
                                   );
                                 }).toList(),
                               ),
                             ],));
                     }
                     else return Center(child: CircularProgressIndicator(),);

                   }
               )


           ),
           SizedBox(height: size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(1) ,
              ),
              Image.asset(
                "assets/images/piechart.png",
                width: 50,
                height: 50,
              ),
              Text(
                "Tip Calculator",
                style: TextStyle(color: const Color(0xFF40B7A9)),
              ),
              Image.asset(
                "assets/images/debit.png",
                width: 50,
                height: 50,
              ),
              Text(
                "Bill Payment ",
                style: TextStyle(color: const Color(0xFF40B7A9)),
              ),Container(
                margin: EdgeInsets.all(1) ,
              ),
            ],
          ),
          SizedBox(height: size.height * 0.03)


          ]
        )
          ),
        );
  }

  Future<List<Slide>> _getList() {
    return Future.value([Slide(
      imageUrl: 'https://i.pinimg.com/originals/f8/1d/b1/f81db1d74e0b1ed5b0f19ed409910a5a.jpg',
      title: 'A Cool Way to Get Start',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
    )
      ,
      Slide(
        imageUrl: 'https://wallpapercave.com/wp/dMugrrP.jpg',
        title: 'Design Interactive App UI',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
      ),
      Slide(
        imageUrl: 'https://images.unsplash.com/photo-1516918656725-e9b3ae9ee7a4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8aGklMjByZXNvbHV0aW9ufGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80',
        title: 'It\'s Just the Beginning',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
      ),Slide(
        imageUrl: 'https://wonderfulengineering.com/wp-content/uploads/2014/03/high-resolution-wallpapers-12.jpg',
        title: 'It\'s Just the Beginning',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
      )]);
  }
}

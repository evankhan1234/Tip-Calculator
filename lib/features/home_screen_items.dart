

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tip_calculator/features/appbar_widget.dart';
import 'package:tip_calculator/API.dart';

import '../Slide.dart';


class HomeScreenItems extends StatefulWidget {
  @override
  _HomeScreenItemsState createState() => _HomeScreenItemsState();
}

class _HomeScreenItemsState extends State<HomeScreenItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context, "Tip Calculator"),
        body:SingleChildScrollView(
        child: Stack(
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
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Container(
                                               color: Color(0xAA333639),
                                               child: Padding(
                                                 padding: const EdgeInsets.all(8),
                                                 child: Text(
                                                   '${item.title}',
                                                   overflow: TextOverflow.ellipsis,
                                                   style: TextStyle(
                                                       color: Colors.white,
                                                       fontSize: 16,
                                                       fontWeight: FontWeight.bold
                                                   ),
                                                 ),
                                               ),
                                             )
                                           ],
                                         )
                                       ],),);
                                     },
                                   );
                                 }).toList(),
                               ),
                               Divider(thickness: 3,),
                               Padding(padding:const EdgeInsets.only(left: 8),
                                   child:Text('Trending',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),)
                               ) ,
                             ],));
                     }
                     else return Center(child: CircularProgressIndicator(),);

                   }
               )


           ),
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
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              color: Color(0xAA333639),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Text(
                                                  '${item.title}',
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],),);
                                    },
                                  );
                                }).toList(),
                              ),
                              Divider(thickness: 3,),
                              Padding(padding:const EdgeInsets.only(left: 8),
                                  child:Text('Trending',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),)
                              ) ,
                            ],));
                    }
                    else return Center(child: CircularProgressIndicator(),);

                  }
              )


          )

          ]
        )
          ),
        );
  }

  Future<List<Slide>> _getList() {
    return Future.value([Slide(
      imageUrl: 'https://etimg.etb2bimg.com/photo/75161189.cms',
      title: 'A Cool Way to Get Start',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
    )
      ,
      Slide(
        imageUrl: 'https://etimg.etb2bimg.com/photo/75161189.cms',
        title: 'Design Interactive App UI',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
      ),
      Slide(
        imageUrl: 'https://etimg.etb2bimg.com/photo/75161189.cms',
        title: 'It\'s Just the Beginning',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
      )]);
  }
}

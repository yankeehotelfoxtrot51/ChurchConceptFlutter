import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<Map> slides = [
  {
    'id': 0,
    'background': "assets/lando-calrissian-dance.gif",
    'date': 'April 15',
    'title': 'Ressurection: Part 3'
  },
  {
    'id': 1,
    'background': "assets/Lando-Leia.gif",
    'date': 'Febuary 6 ',
    'title': 'Terminator: Ressurection'
  },
  {
    'id': 2,
    'background': "assets/lando-return.gif",
    'date': 'March 22',
    'title': 'We Love Jesus'
  },
];

List<String> imagePaths = [
  "assets/lando-calrissian-dance.gif",
  "assets/Lando-Leia.gif",
  "assets/lando-return.gif",
];

class FullscreenSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final double _fullHeight = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: _fullHeight,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              autoPlay: true,
            ),
            items: slides
                .map((item) => Container(
                      padding: EdgeInsets.only(top: 500),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(item['background']),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black54,
                                BlendMode.darken,
                              ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(item['date'],
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18.0)),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 6.0),
                                  child: Text(item['title'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 24.0,
                                      )),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: null,
                                        child: Row(children: [
                                          Text('Experience'),
                                          Icon(Icons.play_arrow_outlined)
                                        ]),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.black87),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.symmetric(
                                                    vertical: 0.5,
                                                    horizontal: 15.0)),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    Size.zero)))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: slides.map((value) {
                                    int index = slides.indexOf(value);
                                    return Container(
                                        width: 8.0,
                                        height: 8.0,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 2.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              shape: BoxShape.circle,
                                              color: item['id'] == index
                                                  ? Colors.white
                                                  : Colors.transparent),
                                        ));
                                  }).toList(),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}

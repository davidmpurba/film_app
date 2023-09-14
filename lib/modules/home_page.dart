import 'package:carousel_slider/carousel_slider.dart';
import 'package:film_app/models/movie.dart';
import 'package:film_app/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final CarouselController _carouselController = CarouselController();
  int currIndex = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [

          //Untuk Menampilkan background film

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Container(
              alignment: Alignment.topCenter,
              key: ValueKey<Image>(movies[currIndex].image),
              child: movies[currIndex].image,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.grey.shade50.withOpacity(1),
                    Colors.grey.shade50.withOpacity(1),
                    Colors.grey.shade50.withOpacity(1),
                    Colors.grey.shade50.withOpacity(0.0),
                    Colors.grey.shade50.withOpacity(0.0),
                    Colors.grey.shade50.withOpacity(0.0),
                    Colors.grey.shade50.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            height: size.height * 0.7,
            width: size.width,
            child: CarouselSlider(
              options: CarouselOptions(
                height: size.height,
                viewportFraction: isExpanded ? 1 : 0.70,
                enlargeCenterPage: true,
                initialPage: currIndex,
                onPageChanged: (index, reason) {
                  setState(() {
                    currIndex = index;
                  });
                },
              ),
              carouselController: _carouselController,
              items: movies.map((movie) {

                //Untuk Menampilkan List Film

                return Builder(
                  builder: (BuildContext context) {
                    return CardWidget(
                      currIndex: currIndex,
                      movie: movie,
                      onTap: () {
                        if (isExpanded) {
                          setState(() {
                            isExpanded = false;
                          });
                        } else {
                          setState(() {
                            isExpanded = true;
                          });
                        }
                      },
                      isExpanded: isExpanded,
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

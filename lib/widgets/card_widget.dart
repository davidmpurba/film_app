import 'package:film_app/models/movie.dart';
import 'package:film_app/utils/font.dart';
import 'package:film_app/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.currIndex,
    required this.movie,
    required this.onTap,
    required this.isExpanded,
  });

  final Movie movie;
  final int currIndex;
  final Function() onTap;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: isExpanded ? size.width : size.width * 0.65,
      height: isExpanded ? size.height : size.height * 0.65,
      child: Container(
        width: size.width * 0.65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Aksi untuk berpindah ke detail film
              GestureDetector(
                onTap: onTap,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: isExpanded ? 0 : 500,
                  height: isExpanded ? 0 : size.height * 0.4,
                  child: Container(
                    height: size.height * 0.4,
                    margin: const EdgeInsets.only(top: 20),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: movie.image,
                  ),
                ),
              ),
              Container(
                height: isExpanded ? size.height : size.height * 0.25,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1000),
                  opacity: currIndex == movies.indexOf(movie) ? 1.0 : 0.0,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    runSpacing: 30,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 12),
                        width: size.width * 0.5,
                        child: Text(
                          movie.name,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: heading4SemiBold(color: Colors.black),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                movie.rating.toString(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: isExpanded ? 100 : 0,
                            height: isExpanded ? 40 : 0,
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(50)),
                                alignment: Alignment.center,
                                child: Text(
                                  movie.genre,
                                  style: subtitle1(color: Colors.grey),
                                )),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.grey.shade600,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                movie.duration,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          AnimatedContainer(
                            width: isExpanded ? 500 : 0,
                            height: isExpanded ? 60 : 0,
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              'Synopsis',
                              style: heading3Bold(color: Colors.black),
                            ),
                          ),
                          AnimatedContainer(
                            width: isExpanded ? 500 : 0,
                            height: isExpanded ? 200 : 0,
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              movie.synopsis,
                              style: subtitle1(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      //button untuk berpindah ke detail film
                      CustomButtonWidget(
                        label: 'Buy Ticket',
                        onPressed: onTap,
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

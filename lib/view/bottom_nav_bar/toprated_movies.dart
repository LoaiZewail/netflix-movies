// ignore_for_file: annotate_overrides, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/model/movie_model.dart';
import 'package:movies/view_model/movies_view_model.dart';

class TopRated extends GetWidget<MoviesViewModel> {
  final controller = Get.put(MoviesViewModel());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getTopRated(),
      builder: (context, AsyncSnapshot snapshot) {
        Movies? data = snapshot.data;
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.5 / 2,
                crossAxisSpacing: 2.5,
                mainAxisSpacing: 2.5,
              ),
              itemCount: data!.results!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/details',
                        arguments: MoviesResults(
                          title: data.results![index].title,
                          overview: data.results![index].overview,
                          posterPath: data.results![index].posterPath,
                        ));
                  },
                  child: Card(
                    elevation: 20,
                    color: Colors.white,
                    margin: EdgeInsets.all(8),
                    child: Container(
                      child: (data.results![index].posterPath == null)
                          ? CircularProgressIndicator(
                              color: Colors.red,
                            )
                          : Image.network(
                              'https://image.tmdb.org/t/p/w500${data.results![index].posterPath.toString()}',
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
      },
    );
  }
}

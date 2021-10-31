// ignore_for_file: annotate_overrides, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/view/bottom_nav_bar/popular_movies.dart';
import 'package:movies/view/bottom_nav_bar/toprated_movies.dart';
import 'package:movies/view/bottom_nav_bar/nowplaying_movies.dart';
import 'package:movies/view_model/movies_view_model.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(MoviesViewModel());

  int currentIndex = 0;
  List<Widget> screens = [NowPlaying(), TopRated(), Popular()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image(
          image: AssetImage('assets/netflix_logo.png'),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 30.0),
          onPressed: () => print('Menu'),
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            onPressed: () => print('Search'),
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.black,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        currentIndex: currentIndex,
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Now Playing',
            icon: Icon(Icons.slow_motion_video_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Top Rated',
            icon: Icon(Icons.movie),
          ),
          BottomNavigationBarItem(
            label: 'Popular',
            icon: Icon(Icons.movie_filter_outlined),
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}

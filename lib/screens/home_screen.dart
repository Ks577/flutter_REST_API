import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'dart:async';
import '../const/colors.dart';
import '../data/gif_service.dart';
import '../widgets/search_form.dart';
import '../widgets/title_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _gifService = GifService();
  String value = '';
  late Future<List<dynamic>> gifsList;

  @override
  void initState() {
    super.initState();
    gifsList = _gifService.getGifsByParameters('Roy Lichtenstein');
  }

  void changeValue(val) {
    gifsList = _gifService.getGifsByParameters(val);
    setState(() {});
    value = val;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 7),
                  titleAnimation(),
                  const SizedBox(height: 7),
                  SearchForm(onSearch: changeValue),
                  const SizedBox(height: 40),
                  _buildGifView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGifView() {
    return FutureBuilder(
        future: gifsList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.all(100),
              child: Center(
                child: LoadingIndicator(
                    indicatorType: Indicator.ballTrianglePathColoredFilled,
                    colors: gradientColors,
                    strokeWidth: 1,
                    pathBackgroundColor: Colors.black),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return GridView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                          snapshot.data![index]['images']['original']["url"],
                        ),
                        fit: BoxFit.cover),
                  ),
                );
              },
            );
          }
        });
  }
}

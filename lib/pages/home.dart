import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:run_way/model/category_model.dart';
import 'package:run_way/pages/categories.dart';
import 'package:run_way/widget/custom_appbar.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  List<CategoryModel> categories = [
    CategoryModel(image: 'assets/category/women.png', name: 'Women'),
    CategoryModel(image: 'assets/category/men.png', name: 'Men'),
    CategoryModel(image: 'assets/category/kids (1).png', name: 'Kids'),
    CategoryModel(image: 'assets/category/deals.png', name: 'Deals'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Runway",
        leading: "assets/svg/bar-chart-2.svg",
        actions: "assets/svg/solar_bell-line-duotone.svg",
      ),
      body: Stack(
        children: [
          //video
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),

          //categories
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 230,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      children: List.generate(
                        categories.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoriesScreen(),
                                  ),
                                ),
                            child: Column(
                              children: [
                                Image.asset(categories[index].image, width: 80),
                                Gap(5),
                                Text(
                                  categories[index].name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

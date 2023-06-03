import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:healthengineapps/core.dart';
import '../../../model/colors/customColors.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            controller.conditionScreen();
          },
          icon: Icon(
            Icons.sort,
            color: CustomColor.darkgreen,
          ),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  List images = [
                    "https://prd-webrepository.firabarcelona.com/wp-content/uploads/sites/9/2019/07/08132310/healthcare-iot-734x340.png",
                    "https://futureiot.tech/wp-content/uploads/2018/11/SAG_LinkedIn-FB_MEME_IoT-in-Healthcare_1200x627_Nov18.jpg",
                    "https://mobisoftinfotech.com/resources/wp-content/uploads/2018/08/IoT-in-healthcare.png",
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqwpH6hiN9fuWNd749C4Fk-m5mE6Ew6WdqiQ&usqp=CAU",
                  ];

                  return Column(
                    children: [
                      CarouselSlider(
                        carouselController: controller.carouselController,
                        options: CarouselOptions(
                          height: 180.0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            controller.currentIndex = index;
                            controller.setState(() {});
                          },
                        ),
                        items: images.map((imageUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      imageUrl,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: images.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => controller.carouselController
                                .animateToPage(entry.key),
                            child: Container(
                              width: 5.0,
                              height: 5.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : CustomColor.darkgreen)
                                    .withOpacity(
                                        controller.currentIndex == entry.key
                                            ? 0.9
                                            : 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 25.0),
              LayoutBuilder(
                builder: (context, constraint) {
                  List menus = [
                    {
                      "icon": "assets/icons/icons1.png",
                      "label": "Assessment",
                      "onTap": () {},
                    },
                    {
                      "icon": "assets/icons/icons2.png",
                      "label": "Symptom",
                      "onTap": () {},
                    },
                    {
                      "icon": "assets/icons/icons3.png",
                      "label": "Tracker",
                      "onTap": () {},
                    },
                  ];

                  return Wrap(
                    children: List.generate(
                      menus.length,
                      (index) {
                        var item = menus[index];

                        var size = constraint.biggest.width / 3.1;

                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: size,
                            height: size,
                            decoration: BoxDecoration(
                              color: CustomColor.darkgreen,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 5,
                                  offset: Offset(3, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: ImageIcon(
                                    AssetImage(
                                      item['icon'].toString(),
                                    ),
                                    size: 50.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  item['label'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.grey[300],
        radius: 30,
        child: IconButton(
          onPressed: () {
            Get.to(MessageView());
          },
          icon: ImageIcon(
            color: CustomColor.darkgreen,
            AssetImage("assets/icons/chat.png"),
            size: 30.0,
          ),
        )
            .animate(onPlay: (controller) => controller.repeat())
            .shake(duration: Duration(milliseconds: 500)),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}

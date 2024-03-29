import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:healthengineapps/core.dart';

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
          icon: const Icon(
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
              SizedBox(
                height: 200,
                child: Builder(builder: (context) {
                  List images = [
                    "https://e1.pxfuel.com/desktop-wallpaper/637/177/desktop-wallpaper-health-care-medical-health-care.jpg",
                    "https://e1.pxfuel.com/desktop-wallpaper/370/368/desktop-wallpaper-the-dual-benefits-of-digital-health-for-clinicians-and-consumers-medical-equipment.jpg",
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStL7rBdjqaLUzvjiMtCFPwNn0tKGNHEb8JvfQLTQgBf6r9nIzBh0pNB1MUokMhH6JzuLk&usqp=CAU",
                  ];

                  return Column(
                    children: [
                      CarouselSlider(
                        carouselController: controller.carouselController,
                        options: CarouselOptions(
                          height: 160.0,
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
                                    Radius.circular(6.0),
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
                              width: 6.0,
                              height: 6.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black)
                                      .withOpacity(
                                          controller.currentIndex == entry.key
                                              ? 0.9
                                              : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(height: 25.0),
              LayoutBuilder(
                builder: (context, constraint) {
                  List menus = [
                    {
                      "icon": "assets/images/penilaian.png",
                      "label": "Penilaian",
                      "onTap": () => Get.to(EvaluationView()),
                    },
                    {
                      "icon": "assets/images/gejala.png",
                      "label": "Gejala",
                      "onTap": () => Get.to(SymptomView()),
                    },
                    {
                      "icon": "assets/images/analisa.png",
                      "label": "Analisa",
                      "onTap": () => Get.to(AnalysisView()),
                    },
                  ];

                  return Wrap(
                    children: List.generate(
                      menus.length,
                      (index) {
                        var item = menus[index];

                        var size = constraint.biggest.width / 3.1;

                        return InkWell(
                          onTap: () {
                            if (item["onTap"] is Function) {
                              item[
                                  "onTap"](); // This should invoke the function
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: size,
                              height: size,
                              decoration: BoxDecoration(
                                color: CustomColor.darkgreen,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: const [
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
                                  Image.asset(
                                    item["icon"],
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.fill,
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

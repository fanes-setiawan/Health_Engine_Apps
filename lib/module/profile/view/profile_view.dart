import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:healthengineapps/core.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;
    List<String> riwayat = [
      "Kulit kering",
      "Dompet kering",
      "Kurang semangat",
      "Kurang uang"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyKpQUy8JP90MAZxFjU0P9bPqkUWL35fd8Ag&usqp=CAU'),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.profileData['name']}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 5,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Aktif",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(EditProfileView());
                    },
                    icon: Icon(
                      Icons.mode_edit,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Card(
                color: Colors.white,
                child: Column(
                  children: [
                    Builder(
                      builder: (context) {
                        List data = [
                          {
                            "icon": Icons.location_on_outlined,
                            "label": "Alamat Rumah",
                            "color": Colors.yellow[100],
                            "date": "tepus",
                            "onTap": () {},
                          },
                          {
                            "icon": Icons.calendar_month_sharp,
                            "label": "Tanggal Lahir",
                            "color": Colors.green[100],
                            "date": "${controller.profileData['birth_of_day']}",
                            "onTap": () {},
                          },
                          {
                            "icon": Icons.boy_rounded,
                            "label": "Jenis Kelamin",
                            "color": Colors.blue[100],
                            "date": "${controller.profileData['gender']}",
                            "onTap": () {},
                          },
                          {
                            "icon": Icons.bloodtype_rounded,
                            "label": "Golongan Darah",
                            "color": Colors.purple[100],
                            "date": "B",
                            "onTap": () {},
                          },
                          {
                            "icon": Icons.favorite_border_sharp,
                            "label": "Riwayat Penyakit",
                            "color": Colors.cyan[100],
                            "onTap": () {},
                          },
                        ];

                        return SizedBox(
                          height: 270.0,
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              var item = data[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      // color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: AnimateList(
                                        interval: 1000.ms,
                                        effects: [FadeEffect(duration: 500.ms)],
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: item['color'],
                                                child: Icon(
                                                  item['icon'],
                                                  size: 24.0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(width: 15.0),
                                              Text(
                                                item['label'],
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15.0,
                                                ),
                                              )
                                            ],
                                          ),
                                          item['label'] != "Riwayat Penyakit"
                                              ? Text(
                                                  item['date'] ?? '',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                )
                                              : DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    elevation: 0,
                                                    value:
                                                        controller.chosenValue,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    items: riwayat.map((value) {
                                                      return DropdownMenuItem(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                    onChanged: (value) {
                                                      controller
                                                          .dropButtom(value);
                                                    },
                                                  ),
                                                )
                                        ],
                                      ),
                                    )),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}

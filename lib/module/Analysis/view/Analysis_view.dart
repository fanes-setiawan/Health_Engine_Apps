import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import '../controller/Analysis_controller.dart';

class AnalysisView extends StatefulWidget {
  const AnalysisView({Key? key}) : super(key: key);

  Widget build(context, AnalysisController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: CustomColor.darkgreen,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        title: const Text("Pencegahan & Saran"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Builder(builder: (context) {
                List<Map<String, dynamic>> buttonData = [
                  {
                    "image":
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ4qdz_6k9_NpfqK7BAt-BHHq8jdNGM6pLviLHTT0FxRkcsCAuW8WK1f5PGVN4mAR8z-I&usqp=CAU", // Anda bisa mengganti dengan path/gambar sesuai kebutuhan
                    "title": "Demam",
                    "text": "Pencegahan dan saran untuk demam"
                  },
                  {
                    "image":
                        "https://asset-a.grid.id/crop/0x0:0x0/x/photo/2020/08/20/2538456640.jpg", // Anda bisa mengganti dengan path/gambar sesuai kebutuhan
                    "title": "Batuk",
                    "text": "Pencegahan dan saran untuk batuk"
                  },
                  {
                    "image":
                        "https://awsimages.detik.net.id/visual/2021/12/17/infografis-penelitian-terbaru-gejala-omicron-ringan-tapiaristya-rahadian-1_169.png?w=400&q=90", // Anda bisa mengganti dengan path/gambar sesuai kebutuhan
                    "title": "Flu",
                    "text": "Pencegahan dan saran untuk flu"
                  },
                  {
                    "image":
                        "https://d1bpj0tv6vfxyp.cloudfront.net/articles/528225_15-11-2020_17-58-48.jpeg", // Anda bisa mengganti dengan path/gambar sesuai kebutuhan
                    "title": "Diare",
                    "text": "Pencegahan dan saran untuk diare"
                  },
                ];
                return SingleChildScrollView(
                  child: Column(
                    children: buttonData.map((item) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: CustomColor.darkgreen,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['title'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            item['text'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/images/bg.png")),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<AnalysisView> createState() => AnalysisController();
}

import 'package:flutter/material.dart';
import 'package:healthengineapps/model/colors/customColors.dart';
import '../controller/Analysis_controller.dart';

class AnalysisView extends StatefulWidget {
  const AnalysisView({Key? key}) : super(key: key);

  Widget build(context, AnalysisController controller) {
    controller.view = this;

    return Scaffold(
      appBar: !controller.isLoading
          ? AppBar(
              // automaticallyImplyLeading: false,
              centerTitle: true,
              titleTextStyle: const TextStyle(
                color: CustomColor.darkgreen,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              title: const Text("Pencegahan & Saran"),
              actions: const [],
            )
          : null,
      body: controller.isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: CustomColor.darkgreen,
            ))
          : SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: controller.responDataAnalysis.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) {
                        var item = controller.responDataAnalysis[index];
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
                                              "${item['nama_penyakit']}",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: CustomColor.greyLight),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "${item['deskripsi']}",
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: CustomColor.greyLight),
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
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      color: Colors.grey[50],
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://d1bpj0tv6vfxyp.cloudfront.net/articles/bb2bab50-b8c6-4a91-9051-b4a4d79e526e_article_image_url.webp',
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  State<AnalysisView> createState() => AnalysisController();
}

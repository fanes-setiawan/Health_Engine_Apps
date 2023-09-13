import 'package:flutter/material.dart';
import 'package:healthengineapps/model/colors/customColors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../controller/symptom_controller.dart';

class SymptomView extends StatefulWidget {
  const SymptomView({Key? key}) : super(key: key);

  Widget build(context, SymptomController controller) {
    controller.view = this;

    return Scaffold(
      appBar: !controller.isLoading
          ? AppBar(
              // automaticallyImplyLeading: false,
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: CustomColor.darkgreen,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              title: const Text("Prediksi Penyakit Pasien"),
              actions: const [],
            )
          : null,
      body: controller.isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: CustomColor.darkgreen,
            ))
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CircularPercentIndicator(
                      radius: controller.presentPrediction,
                      progressColor: controller.presentPrediction < 70
                          ? Colors.red
                          : Colors.green,
                      lineWidth: 13.0,
                      animation: true,
                      percent: 0.7,
                      center: new Text(
                        "${controller.presentPrediction.toString()}%",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: controller.dataPrediction.length,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var item = controller.dataPrediction[index];
                          return ExpansionTile(
                            title: Text(item['nama_penyakit'] ?? ''),
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Gejala: ${item['gejala'] ?? ''}"),
                                    SizedBox(height: 8),
                                    Text(
                                        "Penjelasan: ${item['deskripsi'] ?? ''}"),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  State<SymptomView> createState() => SymptomController();
}

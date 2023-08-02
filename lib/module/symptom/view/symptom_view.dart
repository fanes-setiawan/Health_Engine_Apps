import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controller/symptom_controller.dart';

class SymptomView extends StatefulWidget {
  const SymptomView({Key? key}) : super(key: key);

  Widget build(context, SymptomController controller) {
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
        title: const Text("Prediksi Penyakit Pasien"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  final List<Map> chartData = [
                    {
                      "prediction": "DEMAM",
                      "velue": 30,
                    },
                    {
                      "prediction": "BATUK",
                      "velue": 15,
                    },
                    {
                      "prediction": "FLU",
                      "velue": 40,
                    },
                    {
                      "prediction": "DIARE",
                      "velue": 15,
                    },
                  ];

                  return Container(
                    color: Theme.of(context).cardColor,
                    child: SfCircularChart(
                      title: ChartTitle(
                        text: 'persentase (%)',
                        textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      legend: Legend(isVisible: true),
                      series: <CircularSeries>[
                        PieSeries<Map, String>(
                          dataSource: chartData,
                          dataLabelSettings: DataLabelSettings(
                              isVisible: true, showCumulativeValues: true),
                          xValueMapper: (Map data, _) => data["prediction"],
                          yValueMapper: (Map data, _) => data["velue"],
                        )
                      ],
                    ),
                  );
                },
              ),
              Builder(builder: (context) {
                List<Map<String, dynamic>> data = [
                  {
                    "title": "Demam",
                    "gejala": "Suhu tubuh meningkat di atas normal.",
                    "description":
                        "Untuk mengatasi demam, Anda dapat minum banyak air, istirahat yang cukup, dan mengonsumsi obat penurun demam sesuai petunjuk dokter."
                  },
                  {
                    "title": "Batuk",
                    "gejala": "Bersin-bersin dan batuk-batuk.",
                    "description":
                        "Batuk bisa disebabkan oleh berbagai hal, seperti infeksi pernapasan atau alergi. Untuk mengatasi batuk, Anda bisa minum air hangat, menggunakan pelega tenggorokan, dan menghindari pemicu batuk."
                  },
                  {
                    "title": "Flu",
                    "gejala":
                        "Sakit kepala, demam, hidung berair, dan nyeri otot.",
                    "description":
                        "Flu adalah infeksi virus yang menyerang sistem pernapasan. Untuk mengatasi flu, Anda perlu istirahat yang cukup, minum banyak cairan, dan mungkin mengonsumsi obat pereda gejala flu."
                  },
                  {
                    "title": "Diare",
                    "gejala": "Buang air besar yang sering dan encer.",
                    "description":
                        "Diare adalah kondisi ketika Anda mengalami buang air besar yang sering dan encer. Untuk mengatasi diare, Anda harus banyak minum air agar tidak dehidrasi, hindari makanan yang bisa memperparah diare, dan dapat menggunakan obat diare sesuai anjuran dokter."
                  },
                ];

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: data.map((item) {
                      return ExpansionTile(
                        title: Text(item["title"].toString()),
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Gejala: ${item["gejala"].toString()}"),
                                SizedBox(height: 8),
                                Text(
                                    "Penjelasan: ${item["description"].toString()}"),
                              ],
                            ),
                          ),
                        ],
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
  State<SymptomView> createState() => SymptomController();
}

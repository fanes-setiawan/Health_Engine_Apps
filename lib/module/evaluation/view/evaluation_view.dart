import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controller/evaluation_controller.dart';

class EvaluationView extends StatefulWidget {
  const EvaluationView({Key? key}) : super(key: key);

  Widget build(context, EvaluationController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: CustomColor.darkgreen,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        title: const Text("Data kesehatan pasien"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  final List<Map<String, dynamic>> chartData = [
                    {
                      "date": DateTime(2023, 1, 1),
                      "tekanan_darah": 120,
                      "gula_darah": 95,
                      "denyut_jantung": 90,
                      "color": Colors.blue,
                    },
                    {
                      "date": DateTime(2023, 2, 1),
                      "tekanan_darah": 60,
                      "gula_darah": 85,
                      "denyut_jantung": 125,
                      "color": Colors.green,
                    },
                    {
                      "date": DateTime(2023, 3, 1),
                      "tekanan_darah": 80,
                      "gula_darah": 70,
                      "denyut_jantung": 90,
                      "color": Colors.orange,
                    },
                    {
                      "date": DateTime(2023, 5, 1),
                      "tekanan_darah": 120,
                      "gula_darah": 80,
                      "denyut_jantung": 70,
                      "color": Colors.blue,
                    },
                    {
                      "date": DateTime(2023, 6, 1),
                      "tekanan_darah": 130,
                      "gula_darah": 75,
                      "denyut_jantung": 75,
                      "color": Colors.green,
                    },
                    {
                      "date": DateTime(2023, 7, 1),
                      "tekanan_darah": 110,
                      "gula_darah": 90,
                      "denyut_jantung": 80,
                      "color": Colors.orange,
                    },
                    // Tambahkan data kesehatan selanjutnya jika diperlukan
                  ];

                  return Container(
                    color: Theme.of(context).cardColor,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: SfCartesianChart(
                      primaryXAxis: DateTimeAxis(
                        dateFormat: DateFormat('MMM/yy'),
                      ),
                      primaryYAxis: NumericAxis(),
                      series: <ChartSeries>[
                        LineSeries<Map<String, dynamic>, DateTime>(
                          dataSource: chartData,
                          xValueMapper: (Map<String, dynamic> data, _) =>
                              data["date"],
                          yValueMapper: (Map<String, dynamic> data, _) =>
                              data["tekanan_darah"],
                          color: Colors.blue, // Color for Tekanan Darah series
                          name: 'Tekanan Darah',
                        ),
                        LineSeries<Map<String, dynamic>, DateTime>(
                          dataSource: chartData,
                          xValueMapper: (Map<String, dynamic> data, _) =>
                              data["date"],
                          yValueMapper: (Map<String, dynamic> data, _) =>
                              data["gula_darah"],
                          color: Colors.green, // Color for Gula Darah series
                          name: 'Gula Darah',
                        ),
                        LineSeries<Map<String, dynamic>, DateTime>(
                          dataSource: chartData,
                          xValueMapper: (Map<String, dynamic> data, _) =>
                              data["date"],
                          yValueMapper: (Map<String, dynamic> data, _) =>
                              data["denyut_jantung"],
                          color:
                              Colors.orange, // Color for Denyut Jantung series
                          name: 'Denyut Jantung',
                        ),
                      ],
                    ),
                  );
                },
              ),
              Builder(builder: (context) {
                List category = [
                  {"color": Colors.orange, "title": "Denyut Jantung"},
                  {"color": Colors.blue, "title": "Tekanan Darah"},
                  {"color": Colors.green, "title": "Gula Darah"},
                ];
                return ListView.builder(
                  itemCount: category.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    var item = category[index];
                    return Row(
                      children: [
                        Container(
                          width: 40,
                          height: 20,
                          color: item['color'],
                        ),
                        SizedBox(width: 10),
                        Text(
                          item['title'],
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 12,
                          ),
                        )
                      ],
                    );
                  },
                );
              }),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Text(
                            "Nama Dokter",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Text(
                            "Tanggal Periksa",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Builder(
                builder: (context) {
                  List<Map<String, dynamic>> category = [
                    {"doctor": "Dr. John Doe", "date": "1 Januari 2023"},
                    {"doctor": "Dr. Jane Smith", "date": "15 Februari 2023"},
                    {"doctor": "Dr. Michael Brown", "date": "10 Maret 2023"},
                    {"doctor": "Dr. Emily Johnson", "date": "5 April 2023"},
                    {"doctor": "Dr. William Lee", "date": "20 Mei 2023"},
                    {"doctor": "Dr. Olivia Wilson", "date": "15 Juni 2023"},
                    {"doctor": "Dr. Daniel Thomas", "date": "10 Juli 2023"},
                    {"doctor": "Dr. Sarah Garcia", "date": "25 Agustus 2023"},
                    {"doctor": "Dr. Christopher", "date": "20 September 2023"},
                    {"doctor": "Dr. Elizabeth ", "date": "15 Oktober 2023"},
                    {"doctor": "Dr. Matthew ", "date": "10 November 2023"},
                    {"doctor": "Dr. Jennifer ", "date": "5 Desember 2023"},
                    {"doctor": "Dr. James Turner", "date": "1 Januari 2024"},
                    {"doctor": "Dr. Karen Lewis", "date": "15 Februari 2024"},
                    {"doctor": "Dr. Timothy White", "date": "10 Maret 2024"},
                    {"doctor": "Dr. Jessica Scott", "date": "5 April 2024"},
                    {"doctor": "Dr. Richard Green", "date": "20 Mei 2024"},
                    {"doctor": "Dr. Laura Hill", "date": "15 Juni 2024"},
                    {"doctor": "Dr. Steven Young", "date": "10 Juli 2024"},
                    {"doctor": "Dr. Pamela Martin", "date": "25 Agustus 2024"},
                  ];
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: category.map((item) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Text(
                                    "${item['doctor']}",
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Text(
                                    "${item['date']}",
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
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
  State<EvaluationView> createState() => EvaluationController();
}

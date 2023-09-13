import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../model/colors/customColors.dart';
import '../controller/evaluation_controller.dart';

class EvaluationView extends StatefulWidget {
  const EvaluationView({Key? key}) : super(key: key);

  Widget build(context, EvaluationController controller) {
    controller.view = this;

    return Scaffold(
      appBar: !controller.isLoading
          ? AppBar(
              // automaticallyImplyLeading: false
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: CustomColor.darkgreen,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              title: const Text("Data kesehatan pasien"),
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
                    Builder(
                      builder: (context) {
                        List<Map<String, dynamic>> datai = [
                          {
                            "tanggal": "2023-09-18",
                            "tekanan_darah": 84,
                            "gula_darah": 100
                          },
                          {
                            "tanggal": "2023-09-17",
                            "tekanan_darah": 87,
                            "gula_darah": 112
                          },
                          {
                            "tanggal": "2023-09-16",
                            "tekanan_darah": 95,
                            "gula_darah": 98
                          },
                          {
                            "tanggal": "2023-09-15",
                            "tekanan_darah": 78,
                            "gula_darah": 105
                          },
                          {
                            "tanggal": "2023-09-14",
                            "tekanan_darah": 92,
                            "gula_darah": 115
                          },
                          {
                            "tanggal": "2023-09-13",
                            "tekanan_darah": 88,
                            "gula_darah": 120
                          },
                          {
                            "tanggal": "2023-09-12",
                            "tekanan_darah": 85,
                            "gula_darah": 100
                          },
                          {
                            "tanggal": "2023-09-11",
                            "tekanan_darah": 90,
                            "gula_darah": 95
                          },
                          {
                            "tanggal": "2023-09-10",
                            "tekanan_darah": 80,
                            "gula_darah": 110
                          }
                        ];
                        datai.forEach((data) {
                          String tanggalString = data["tanggal"];
                          DateTime tanggal = DateTime.parse(tanggalString);
                          data["tanggal"] = tanggal;
                        });
                        return Container(
                          // color: Theme.of(context).cardColor,
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: SfCartesianChart(
                            primaryXAxis: DateTimeAxis(
                              dateFormat: DateFormat('MM/dd'),
                            ),
                            primaryYAxis: NumericAxis(),
                            series: <ChartSeries>[
                              LineSeries<Map<String, dynamic>, DateTime>(
                                dataSource: datai,
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data["tanggal"],
                                yValueMapper: (Map<String, dynamic> data, _) =>
                                    data["tekanan_darah"],
                                color: Colors
                                    .blue, // Color for Tekanan Darah series
                                name: 'Tekanan Darah',
                              ),
                              LineSeries<Map<String, dynamic>, DateTime>(
                                dataSource: datai,
                                xValueMapper: (Map<String, dynamic> data, _) =>
                                    data["tanggal"],
                                yValueMapper: (Map<String, dynamic> data, _) =>
                                    data["gula_darah"],
                                color:
                                    Colors.green, // Color for Gula Darah series
                                name: 'Gula Darah',
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: controller.data[1]['riwayat_periksa'].length,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var check =
                              controller.data[1]['riwayat_periksa'][index];
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
                                      check['nama_dokter'],
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
                                      check['tanggal'],
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
  State<EvaluationView> createState() => EvaluationController();
}

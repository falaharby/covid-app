import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:si_covid/component/provinsi_component.dart';
import 'package:si_covid/models/provinsi_model.dart';
import 'package:http/http.dart' as http;

class ProvinsiPage extends StatefulWidget {
  @override
  _ProvinsiPageState createState() => _ProvinsiPageState();
}

class _ProvinsiPageState extends State<ProvinsiPage> {
  List<Provinsi> dataProvinsi = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var url = Uri.parse('https://api.kawalcorona.com/indonesia/provinsi/');
    await http.get(url).then((value) {
      var response = json.decode(value.body);
      for (var i in response) {
        dataProvinsi.add(Provinsi(
            provinsi: i['attributes']['Provinsi'],
            positif: i['attributes']['Kasus_Posi'],
            sembuh: i['attributes']['Kasus_Semb'],
            meninggal: i['attributes']['Kasus_Meni']));
      }
      print(dataProvinsi);
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 60, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Data Per Provinsi',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              (isLoading)
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Column(
                      children: List.generate(
                          dataProvinsi.length,
                          (index) => ProvinsiComponent(
                                provinsi: dataProvinsi[index].provinsi,
                                positif: dataProvinsi[index].positif,
                                meninggal: dataProvinsi[index].meninggal,
                                sembuh: dataProvinsi[index].sembuh,
                              )),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

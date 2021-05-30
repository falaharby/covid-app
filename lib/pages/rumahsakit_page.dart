import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:si_covid/component/search_component.dart';
import 'package:si_covid/models/rumahsakit_model.dart';

class RumahSakitPage extends StatefulWidget {
  @override
  _RumahSakitPageState createState() => _RumahSakitPageState();
}

class _RumahSakitPageState extends State<RumahSakitPage> {
  List<RumahSakit> rumahSakits = [];
  String query = '';
  Timer debouncer;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final rumahSakits = await getRS(query);

    setState(() => this.rumahSakits = rumahSakits);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Rumah Sakit Rujukan',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          buildSearch(),
          (isLoading)
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: rumahSakits.length,
                    itemBuilder: (context, index) {
                      final rs = rumahSakits[index];

                      return buildRS(rs);
                    },
                  ),
                ),
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Masukkan Nama Daerah',
        onChanged: searchBook,
      );

  Future searchBook(String query) async => debounce(() async {
        final rumahSakits = await getRS(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.rumahSakits = rumahSakits;
        });
      });

  Widget buildRS(RumahSakit rs) => Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 10),
            child: Row(
              children: [
                Image.asset(
                  'assets/hospital.png',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.only(left: 25),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (rs.name.contains(
                                'RS UMUM DAERAH K.R.M.T WONGSONEGORO'))
                            ? 'RSUD TUGUREJO'
                            : (rs.name.contains('RS UMUM DAERAH PASAR MINGGU'))
                                ? 'RSUD PASAR REBO'
                                : rs.name,
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        (rs.address.contains('JL. FATMAWATI RAYA NO.1'))
                            ? 'JL. WALISONGO NO. 137 KM. 8.5, TAMBAKAJI'
                            : (rs.address.contains(
                                    'JL. TB. SIMATUPANG NO.1 KELURAHAN RAGUNAN'))
                                ? 'JL. TB. SIMATUPANG NO. 30, GEDONG, JAKARTA TIMUR'
                                : rs.address,
                        style: TextStyle(fontSize: 9, color: Colors.grey),
                      ),
                      Text(
                        rs.region,
                        style: TextStyle(fontSize: 9, color: Colors.grey),
                      ),
                      Text(
                        rs.phone ?? '',
                        style: TextStyle(fontSize: 9, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 18),
            height: 1.5,
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.grey[200],
          )
        ],
      );

  Widget buildBook(RumahSakit rs) => ListTile(
        leading: Image.asset(
          'assets/hospital.png',
          fit: BoxFit.cover,
          width: 40,
          height: 40,
        ),
        title: Text(
          rs.name,
          style: TextStyle(fontSize: 12),
        ),
        subtitle: Column(
          children: [
            Text(
              rs.address,
              style: TextStyle(fontSize: 10),
            ),
            Text(
              rs.region,
              style: TextStyle(fontSize: 10),
            ),
            Text(
              rs.phone ?? '',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      );

  Future<List<RumahSakit>> getRS(String query) async {
    final url = Uri.parse('https://dekontaminasi.com/api/id/covid19/hospitals');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List rumahSakit = json.decode(response.body);
      isLoading = false;
      setState(() {});
      return rumahSakit.map((json) => RumahSakit.fromJson(json)).where((rs) {
        final regionLower = rs.region.toLowerCase();
        final provinceLower = rs.province.toLowerCase();
        final searchLower = query.toLowerCase();

        return regionLower.contains(searchLower) ||
            provinceLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}

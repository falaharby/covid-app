import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:si_covid/component/chart_component.dart';
import 'package:si_covid/component/global_data_component.dart';
import 'package:si_covid/component/indonesia_data_component.dart';
import 'package:si_covid/component/news_component.dart';
import 'package:http/http.dart' as http;
import 'package:si_covid/models/news_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double getDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 1.8 / 2;

  bool isGlobal = false;
  bool isNewsLoading = true;
  bool isIndonesiaLoading = true;
  bool isGlobalLoading = true;
  bool isChartLoading = true;

  List<News> news = [];
  Map dataIndonesia = {};
  Map dataGlobal = {};
  List dailyData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDailyData();
    getIndonesia();
    getGlobal().then((_) {
      print(dataGlobal);
      setState(() {
        isGlobalLoading = false;
      });
    });
    getNews();
  }

  getIndonesia() async {
    var url = Uri.parse('https://data.covid19.go.id/public/api/update.json');
    await http.get(url).then((value) {
      var response = json.decode(value.body);
      dataIndonesia = response['update']['total'];
      isIndonesiaLoading = false;
      setState(() {});
    });
  }

  getGlobal() async {
    var urlPositif = Uri.parse('https://api.kawalcorona.com/positif');
    var urlSembuh = Uri.parse('https://api.kawalcorona.com/sembuh');
    var urlMeninggal = Uri.parse('https://api.kawalcorona.com/meninggal');
    await http.get(urlPositif).then((value) {
      var response = json.decode(value.body);
      dataGlobal['positif'] = response['value'];
    });
    await http.get(urlSembuh).then((value) {
      var response = json.decode(value.body);
      dataGlobal['sembuh'] = response['value'];
    });
    await http.get(urlMeninggal).then((value) {
      var response = json.decode(value.body);
      dataGlobal['meninggal'] = response['value'];
    });
  }

  getNews() async {
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=id&q=covid&apiKey=896d2a20911d43f6b3eae6ce005ce069');
    await http.get(url).then((value) {
      var response = json.decode(value.body);
      if (response['status'] == 'ok') {
        for (var i in response['articles']) {
          String realDate = i['publishedAt'];
          List tanggal = realDate.split('T');

          news.add(News(
              source: i['source']['name'],
              title: i['title'],
              url: i['url'],
              imageUrl: i['urlToImage'],
              date: tanggal[0]));
        }
        isNewsLoading = false;
        setState(() {});
      } else {
        print('Gagal Fetch Data');
      }
    });
  }

  getDailyData() async {
    var url = Uri.parse('https://data.covid19.go.id/public/api/update.json');
    await http.get(url).then((value) {
      var response = json.decode(value.body);
      var resHarian = response['update']['harian'];
      for (var i = 0; i < 30; i++) {
        dailyData.add(resHarian[(resHarian.length - (i + 1))]['jumlah_positif']
                ['value']
            .toDouble());
      }
      print(dailyData[0].toString());
      isChartLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              right: -getDiameter(context) / 2.5,
              top: -getDiameter(context) / 5,
              child: Container(
                width: getDiameter(context),
                height: getDiameter(context),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE3FFD6),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, left: 35, right: 35),
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/SiCovid.png'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60, left: 35, right: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/banner.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Update Status',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFF93D773),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 26,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: !isGlobal
                                  ? Color(0xFFCAFFB1)
                                  : Color(0xFF93D773),
                            ),
                            child: Center(
                              child: Text(
                                'Indonesia',
                                style: TextStyle(
                                  color: !isGlobal
                                      ? Color(0xFF383838)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            isGlobal = false;
                            setState(() {});
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 26,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: !isGlobal
                                  ? Color(0xFF93D773)
                                  : Color(0xFFCAFFB1),
                            ),
                            child: Center(
                              child: Text(
                                'Global',
                                style: TextStyle(
                                  color: !isGlobal
                                      ? Colors.white
                                      : Color(0xFF383838),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            isGlobal = true;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  isGlobal
                      ? isGlobalLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : GlobalData(
                              positif: dataGlobal['positif'],
                              sembuh: dataGlobal['sembuh'],
                              meninggal: dataGlobal['meninggal'],
                            )
                      : isIndonesiaLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : IndonesiaData(
                              positif: dataIndonesia['jumlah_positif'],
                              dirawat: dataIndonesia['jumlah_dirawat'],
                              sembuh: dataIndonesia['jumlah_sembuh'],
                              meninggal: dataIndonesia['jumlah_meninggal'],
                            ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Statistik Kasus Positif Corona',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Selama 30 Hari Terakhir di Indonesia',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  (isChartLoading)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : LineChartSample2(dailyData),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Berita Hari Ini',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  (isNewsLoading)
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          children: List.generate(
                            news.length,
                            (index) => NewsComponent(
                              source: news[index].source,
                              title: news[index].title,
                              url: news[index].url,
                              imageUrl: news[index].imageUrl,
                              date: news[index].date,
                            ),
                          ),
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF93D773),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/tips.png',
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(18)),
              padding:
                  EdgeInsets.only(top: 25, bottom: 35, left: 18, right: 18),
              margin: EdgeInsets.only(left: 17, right: 17, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 32, right: 32),
                    decoration: BoxDecoration(
                        color: Color(0xFF90BD7B),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'Gejala yang Paling Umum',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  listText(context, 'Demam'),
                  listText(context, 'Batuk Kering'),
                  listText(context, 'Kelelahan'),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 32, right: 32),
                    decoration: BoxDecoration(
                        color: Color(0xFF90BD7B),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'Gejala yang Sedikit Tidak Umum',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  listText(context, 'Rasa tidak nyaman dan nyeri'),
                  listText(context, 'Nyeri tenggorokan'),
                  listText(context, 'Diare'),
                  listText(context, 'Konjungtivitis (mata merah)'),
                  listText(context, 'Sakit kepala'),
                  listText(context, 'Hilangnya indera perasa atau penciuman'),
                  listText(context,
                      'Ruam pada kulit, atau perubahan warna pada jari tangan atau jari kaki'),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 32, right: 32),
                    decoration: BoxDecoration(
                        color: Color(0xFF90BD7B),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'Gejala Serius',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  listText(context, 'Kesulitan bernapas atau sesak napas'),
                  listText(context, 'Nyeri dada atau rasa tertekan pada dada'),
                  listText(
                      context, 'Hilangnya kemampuan berbicara atau bergerak'),
                ],
              ),
            ),
            Image.asset(
              'assets/tips2.png',
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(18)),
              padding:
                  EdgeInsets.only(top: 25, bottom: 35, left: 18, right: 18),
              margin: EdgeInsets.only(left: 17, right: 17, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 32, right: 32),
                    decoration: BoxDecoration(
                        color: Color(0xFF90BD7B),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'Untuk Mencegah Penyebaran Virus',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  listText(context,
                      'Cuci tangan Anda secara rutin. Gunakan sabun dan air, atau cairan pembersih tangan berbahan alkohol.'),
                  listText(context,
                      'Selalu jaga jarak aman dengan orang yang batuk atau bersin.'),
                  listText(context,
                      'Kenakan masker jika pembatasan fisik tidak dimungkinkan.'),
                  listText(
                      context, 'Jangan sentuh mata, hidung, atau mulut Anda.'),
                  listText(context,
                      'Saat batuk atau bersin, tutup mulut dan hidung Anda dengan lengan atau tisu.'),
                  listText(context,
                      'Jangan keluar rumah jika merasa tidak enak badan.'),
                  listText(context,
                      'Jika demam, batuk, atau kesulitan bernapas, segera cari bantuan medis.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container listText(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.11,
            padding: EdgeInsets.only(right: 10, top: 1.5),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.circle,
                color: Color(0xFF90BD7B),
                size: 9,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.695,
            padding: EdgeInsets.only(left: 10, right: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                text,
                style: TextStyle(fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}

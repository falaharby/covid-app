import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IndonesiaData extends StatelessWidget {
  int positif, dirawat, sembuh, meninggal;

  IndonesiaData({this.positif, this.dirawat, this.sembuh, this.meninggal});
  // var formatter = NumberFormat('###.###.###.###');
  var f = NumberFormat.decimalPattern("id");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.38,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFFFD541),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Positif',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    f.format(positif) ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.38,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF73B3D7),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dirawat',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    f.format(dirawat) ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.38,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF93D773),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sembuh',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    f.format(sembuh) ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.38,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFF16B6B),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meninggal',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    f.format(meninggal) ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProvinsiComponent extends StatelessWidget {
  String provinsi;
  int positif, sembuh, meninggal;

  ProvinsiComponent({this.positif, this.provinsi, this.sembuh, this.meninggal});

  var f = NumberFormat.decimalPattern("id");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          padding: EdgeInsets.only(top: 5, right: 13, left: 13, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF93D773),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width * 0.30,
                child: Text(
                  provinsi,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Container(
                margin: EdgeInsets.all(3),
                padding: EdgeInsets.only(top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width * 0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFFFFF7B1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Positif',
                      style: TextStyle(fontSize: 8),
                    ),
                    Text(
                      f.format(positif) ?? '',
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(3),
                padding: EdgeInsets.only(top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width * 0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFFCAFFB1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sembuh',
                      style: TextStyle(fontSize: 8),
                    ),
                    Text(
                      f.format(sembuh) ?? '',
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(3),
                padding: EdgeInsets.only(top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width * 0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFFFFFA2A2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Meninggal',
                      style: TextStyle(fontSize: 8),
                    ),
                    Text(
                      f.format(meninggal) ?? '',
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

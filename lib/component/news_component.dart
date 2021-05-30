import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsComponent extends StatelessWidget {
  String source, title, url, imageUrl, date;

  NewsComponent({this.source, this.title, this.url, this.imageUrl, this.date});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            await launch(url);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl ??
                          'https://developers.google.com/maps/documentation/streetview/images/error-image-generic.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.2,
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      // overflow: TextOverflow.ellipsis,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    Text(
                      source,
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 1.8,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[300],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

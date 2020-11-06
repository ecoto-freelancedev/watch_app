import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:watch_app/screens/detail_page.dart';
import 'package:watch_app/widgets/card_shimmer.dart';

class ViewPage2 extends StatelessWidget {
  final String assetName;

  const ViewPage2({this.assetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 315,
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('json/data.json'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            final data = jsonDecode(snapshot.data.toString());
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[1]['brand'],
                              style: GoogleFonts.frankRuhlLibre(
                                textStyle: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              data[1]['model'],
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.read_more,
                              size: 50,
                              color: Colors.brown,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        assetName: assetName,
                                        watchData: data[1],
                                      )));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      data[1]['detail'],
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      data[1]['price'],
                      style: GoogleFonts.frankRuhlLibre(
                        textStyle: TextStyle(
                          color: Colors.brown,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              enabled: true,
              period: Duration(seconds: 3),
              direction: ShimmerDirection.ltr,
              child: CardShimmer(),
            );
          }
        },
      ),
    );
  }
}

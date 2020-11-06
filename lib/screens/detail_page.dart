import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  final String assetName;
  final watchData;

  const DetailPage({this.assetName, this.watchData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(30)),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Container(
                          height: 350,
                          width: 362,
                          color: Colors.brown.withOpacity(0.3),
                          child: Hero(
                            tag: 'watch',
                            child: Image(
                              image: AssetImage(assetName),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 25,
                    child: Text(
                      watchData['brand'],
                      style: GoogleFonts.frankRuhlLibre(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.0, 1.0),
                              blurRadius: 8.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 30,
                    child: Text(
                      watchData['model'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 1.0),
                            blurRadius: 8.0,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    watchData['price'],
                    style: GoogleFonts.frankRuhlLibre(
                      textStyle: TextStyle(
                        color: Colors.brown,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    watchData['fullDetail'],
                    maxLines: 15,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 75,
                    child: RaisedButton(
                      color: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'ADD TO BAG',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 25),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

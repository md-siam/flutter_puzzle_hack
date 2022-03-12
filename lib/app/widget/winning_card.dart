import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WinningCard extends StatelessWidget {
  const WinningCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          height: 300,
          color: const Color(0xff15294a),
          child: Stack(
            fit: StackFit.expand,
            children: [
              const Positioned(
                left: -170,
                top: -170,
                child: CircleAvatar(
                  radius: 130,
                  backgroundColor: Color(0xff3554d3),
                ),
              ),
              const Positioned(
                left: -160,
                top: -190,
                child: CircleAvatar(
                  radius: 130,
                  backgroundColor: Color(0xff375efd),
                ),
              ),
              const Positioned(
                right: -170,
                bottom: -170,
                child: CircleAvatar(
                  radius: 130,
                  backgroundColor: Color(0xffe7ad03),
                ),
              ),
              const Positioned(
                right: -160,
                bottom: -190,
                child: CircleAvatar(
                  radius: 130,
                  backgroundColor: Color(0xfffbbd5c),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Congratulations!!\nYou Won!!\n",
                    style: GoogleFonts.alata(
                      fontSize: 30,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xffe7ad03),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  RawMaterialButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 15.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Close',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    fillColor: const Color(0xff3554d3),
                    splashColor: const Color(0xffe7ad03),
                    hoverColor: Colors.transparent,
                    shape: const StadiumBorder(),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

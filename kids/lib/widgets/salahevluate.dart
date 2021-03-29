import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:kids/models/db.dart';
import 'package:kids/screens/azkar.dart';
import 'package:kids/screens/salah.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:page_transition/page_transition.dart';

class Salahev extends StatefulWidget {
  Color color;
  Color color1;
  Color color2;
  String text;
  String time;

  Salahev(this.text, this.time, this.color, this.color1, this.color2);

  @override
  _SalahevState createState() => _SalahevState();
}

class _SalahevState extends State<Salahev> {
  bool a = false;
  bool s = false;
  bool d = false;
  bool circle1 = false;
  bool circle2 = false;
  bool done = false;
  String salah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          child: ListView(
            //   shrinkWrap: true,
            children: [
              Container(
                color: this.widget.color,
                height: 271,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.1,
                      right: 25,
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              this.widget.text,
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: this.widget.color2,
                                    letterSpacing: .5,
                                    fontSize: 28),
                              ),
                            ),
                          ),
                          Text(this.widget.time,
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: this.widget.color1,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: .5,
                                    fontSize: 20),
                              )),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -1,
                      left: 10,
                      child: Container(
                          child: Image.asset('assets/images/Group 77.png')),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02)
                    .add(EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.03)),
                child: Text('Prayer time ?',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Theme.of(context).accentColor,
                          letterSpacing: .5,
                          fontSize: 20),
                    )),
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        a = !a;
                        s = false;
                        d = false;
                        print(a);
                      });
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/images/Mask Group 1.png'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('No',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: (a)
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).accentColor,
                                  letterSpacing: .5,
                                  fontSize: 20),
                            ))
                      ],
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        s = !s;
                        a = false;
                        d = false;
                      });
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/images/Group 2386.png'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Late',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: (s)
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).accentColor,
                                  letterSpacing: .5,
                                  fontSize: 20),
                            ))
                      ],
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        d = !d;
                        a = false;
                        s = false;
                      });
                      Dialogs.materialDialog(
                          customView: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.05),
                                  child: Text(
                                    'How you prayed?',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            salah = 'gam3a';
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(2),
                                          child: CircleAvatar(
                                            radius: 60,
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            child: Image.asset(
                                                'assets/images/Group 705.png'),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                          child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            salah = 'fardi';
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          child: CircleAvatar(
                                            radius: 60,
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            child: Image.asset(
                                                'assets/images/Group 709.png'),
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          titleStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 25),
                          color: Colors.white,
                          //    animation: 'assets/cong_example.json',
                          context: context,
                          actions: [
                            Container(
                              height: 40,
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.1),
                              child: IconsButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {},
                                text: 'cancel',
                                color: Theme.of(context).accentColor,
                                textStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ]);
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/images/Mask Group 3.png'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('on time',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: (d)
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).accentColor,
                                  letterSpacing: .5,
                                  fontSize: 20),
                            ))
                      ],
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02)
                    .add(EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.03)),
                child: Text('You should to read athkar after pray !',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Theme.of(context).accentColor,
                          letterSpacing: .5,
                          fontSize: 20),
                    )),
              ),
              Container(
                height: 35,
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.3),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor)),
                  onPressed: () {
                    print(salah);
                    (done)
                        ?
                           Navigator.of(context).pop()
                                 //     Navigator.pop(context);
                        /* Navigator.pushReplacement(
                            context,
                            PageTransition(
                              duration: Duration(milliseconds: 600),
                              type: PageTransitionType.fade,
                              child: Salah(),
                            ))
                            */
                        : Navigator.push(
                            context,
                            PageTransition(
                              duration: Duration(milliseconds: 600),
                              type: PageTransitionType.fade,
                              child: Azkar(),
                            ));
                    setState(() {
                      done = true;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (done)
                          ? Text(
                              'Done',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )
                          : Text(
                              'Go',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              /*
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.3)
                    .add(EdgeInsets.only(bottom: 10)),
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).accentColor)),
                    onPressed: () {},
                    child: Text(
                      'Done',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
              */
            ],
          ),
        ));
  }
}

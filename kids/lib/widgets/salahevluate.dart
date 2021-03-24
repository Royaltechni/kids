import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids/models/db.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class Salahev extends StatefulWidget {
  Color color;
  String text;
  String time;

  Salahev(this.text, this.time, this.color);

  @override
  _SalahevState createState() => _SalahevState();
}

class _SalahevState extends State<Salahev> {
  bool a = false;
  bool s = false;
  bool d = false;
  bool circle1 = false;
  bool circle2 = false;

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
                                    color: Colors.black,
                                    letterSpacing: .5,
                                    fontSize: 28),
                              ),
                            ),
                          ),
                          Text(this.widget.time,
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Color.fromARGB(101, 103, 103, 1),
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
                        Image.asset('assets/images/Mask Group 3.png'),
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
                                  margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.05),
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
                                          child: Container(
                                        margin: EdgeInsets.all(2),
                                        child: CircleAvatar(
                                          radius: 60,
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          child: Image.asset(
                                              'assets/images/Group 705.png'),
                                        ),
                                      )),
                                      Expanded(
                                          child: CircleAvatar(
                                        radius: 60,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        child: Image.asset(
                                            'assets/images/Group 709.png'),
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
                        Image.asset('assets/images/Mask Group 2.png'),
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
                    horizontal: MediaQuery.of(context).size.width * 0.35),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor)),
                  onPressed: () {
                    Dbhandler.instance.getslider();
                  },
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          'Read',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Image.asset('assets/images/ab.png'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            circle1 = !circle1;
                            circle2 = false;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: circle1
                              ? Theme.of(context).accentColor
                              : Theme.of(context).primaryColor,
                          radius: 40,
                          child: Icon(
                            Icons.cancel,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            circle2 = !circle2;
                            circle1 = false;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: circle2
                              ? Theme.of(context).accentColor
                              : Theme.of(context).primaryColor,
                          radius: 40,
                          child: Icon(
                            Icons.check_sharp,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
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
            ],
          ),
        ));
  }
}

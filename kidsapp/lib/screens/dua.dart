import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/models/db.dart';
import 'package:kidsapp/providers/duaaprovider.dart';
import 'package:kidsapp/screens/ramdanscreen.dart';
import 'package:kidsapp/widgets/gift.dart';
import 'package:kidsapp/widgets/ramdanitem2.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';

class Dua extends StatefulWidget {
  @override
  _DuaState createState() => _DuaState();
}

class _DuaState extends State<Dua> {
  bool loading;
  bool play;
  AudioPlayer advancedPlayer;
  @override
  void initState() {
    super.initState();
    loading = false;
    advancedPlayer = AudioPlayer();
    play = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Ramdanitem2.b('Duaa of the Day', 'assets/images/duaa.png'),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                Provider.of<Duaaprovider>(context, listen: false)
                    .duaa
                    .data[Ramdan.day - 1]
                    .title,
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                Provider.of<Duaaprovider>(context, listen: false)
                    .duaa
                    .data[Ramdan.day - 1]
                    .descriptionAr,
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                Provider.of<Duaaprovider>(context, listen: false)
                    .duaa
                    .data[Ramdan.day - 1]
                    .descriptionEn,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 16),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                Provider.of<Duaaprovider>(context, listen: false)
                    .duaa
                    .data[Ramdan.day - 1]
                    .descriptionFr,
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          play = !play;
                        });
                        play
                            ? await advancedPlayer.play(
                                Provider.of<Duaaprovider>(context,
                                        listen: false)
                                    .duaa
                                    .data[Ramdan.day - 1]
                                    .audio)
                            : await advancedPlayer.pause();
                      },
                      child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: play
                              ? Icon(
                                  Icons.pause_outlined,
                                  color: Colors.white,
                                  size: 45,
                                )
                              : Icon(
                                  Icons.play_arrow_sharp,
                                  color: Colors.white,
                                  size: 45,
                                )),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                          onTap: () async {
                            await advancedPlayer.stop();
                            setState(() {
                              play = false;
                            });
                          },
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(
                                Icons.stop,
                                color: Colors.white,
                                size: 45,
                              )),
                        )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.3)
                  .add(EdgeInsets.symmetric(vertical: 10)),
              child: loading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).accentColor)),
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        await Dbhandler.instance
                            .duaaread((Ramdan.day - 1).toString(), 'read');
                        setState(() {
                          loading = false;
                        });
                        if (Dbhandler.instance.duaareadd == 200) {
                          Dialogs.materialDialog(
                              customView: Container(
                                child: Gift(
                                  'بارك الله فيك',
                                  ' May Allah Bless You',
                                  '  assets/images/Group 795.png',
                                  Colors.white,
                                  Colors.white,
                                  Color.fromRGBO(255, 72, 115, 1),
                                  Colors.white,
                                  Colors.white,
                                  Color.fromRGBO(255, 72, 115, 1),
                                ),
                              ),
                              titleStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 25),
                              color: Colors.white,
                              context: context,
                              actions: [
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.1),
                                  child: IconsButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                    text: 'Done',
                                    color: Color.fromRGBO(255, 72, 115, 1),
                                    textStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ]);
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        'Finsh',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

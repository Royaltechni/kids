import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsapp/providers/lanprovider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutus extends StatelessWidget {
  static const String route = '/Aboutus';

  _launchURL(String url) async {
    //  String url = 'https://api.whatsapp.com/send?phone=$num';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  makingwhatsapp(String num) async {
    String url = 'https://api.whatsapp.com/send?phone=$num';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _sendemail(String url) async {
    final Uri _emailLaunchUri =
        Uri(scheme: 'mailto', path: url, queryParameters: {'subject': ' '});
    launch(_emailLaunchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            Provider.of<Lanprovider>(context, listen: false).isenglish
                ? 'Contact Us'
                : 'معلومات عنا',
            style: GoogleFonts.roboto(
              letterSpacing: 0.5,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'Contact Us If you have any questions about this Policy, You can contact us: ',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                 
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  _sendemail(' info@royaltechni.com');
                },
                child: Text(
                  '• By email: info@royaltechni.com ',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                     color: Colors.blue
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  _makePhoneCall('https://www.royaltechni.com');
                },
                child: Text(
                  '• By visiting this page on our website: https://www.royaltechni.com ',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                     color: Colors.blue
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (){
                  _makePhoneCall('tel:971553114946');
                },
                child: Text(
                  '• By phone number: +971553114946 ',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                     color: Colors.blue
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () async {
                        await _launchURL(
                            'https://www.facebook.com/Royaltechni/');
                      },
                      child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                            size: 35,
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await makingwhatsapp('+971 55 311 4946');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.white,
                            size: 35,
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _launchURL(
                          'https://instagram.com/royal_techni?utm_medium=copy_link');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                            size: 35,
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

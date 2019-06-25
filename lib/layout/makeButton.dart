import 'package:flutter/material.dart';
import 'package:database/screen/profille.dart';
import 'package:database/screen/add_person.dart';
import 'package:database/screen/add_deal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MakeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: BottomAppBar(
        clipBehavior: Clip.none,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Expanded(
                child: FlatButton(
                  child: Padding(
                    padding: const EdgeInsets.only(top:5.0),
                    child: Column(
                      children: <Widget>[
                        SvgPicture.asset('images/icons/dashboard.svg'),
                        Text('Dashboard',style: TextStyle(fontSize: 8.0),),
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AddPerson.id);
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Column(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.handshake, color: Color(0xff555555)),
                      Text('Deal',style: TextStyle(fontSize: 8.0),),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AddDeal.id);
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Column(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.calendarAlt,
                          color: Color(0xff5555555)),
                      Text('Activities',style: TextStyle(fontSize: 8.0),),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AddPerson.id);
                  },
                ),
                flex: 1,
              ),
              Expanded(
                child: FlatButton(
                  child: Column(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.addressBook,
                          color: Color(0xff5555555)),
                      Text('Contact',style: TextStyle(fontSize: 8.0),),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AddPerson.id);
                  },
                ),
                flex: 1,
              ),
              Expanded(
                child: IconButton(
                  icon:
                      Icon(FontAwesomeIcons.ellipsisH, color: Color(0xff555555)),
                  onPressed: () {
                    Navigator.pushNamed(context, Profile.id);
                  },
                ),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

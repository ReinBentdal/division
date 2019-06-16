// App design: https://dribbble.com/shots/6459693-Creative-layout-design

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: UserPage(),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  Widget _buildTitle(String title) {
    return Division(
      style: StyleClass()
        ..margin(vertical: 20.0)
        ..alignChild('left'),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Division(
      style: StyleClass()..margin(left: 20, right: 20, top: 30),
      child: Column(
        children: <Widget>[
          _buildTitle('User settings'),
          UserCard(),
          ActionsRow(),
          Settings(),
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  Widget _buildUserRow() {
    return Row(
      children: <Widget>[
        Division(
          style: userImageStyle,
          child: Icon(Icons.account_circle),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Rein Gundersen Bentdal',
              style: nameTextStyle,
            ),
            SizedBox(height: 5,),
            Text(
              'Creative builder',
              style: nameDescriptionTextStyle,
            )
          ],
        )
      ],
    );
  }

  Widget _buildUserStats() {
    return Division(
      style: userStatsStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildUserStatsItem(846, 'Collect'),
          _buildUserStatsItem(51, 'Attention'),
          _buildUserStatsItem(267, 'Track'),
          _buildUserStatsItem(39, 'Coupons'),
        ],
      ),
    );
  }

  Widget _buildUserStatsItem(int value, String text) {
    return Column(
      children: <Widget>[
        Text(
          value.toString(),
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: nameDescriptionTextStyle,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Division(
      style: userCardStyle,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[_buildUserRow(), _buildUserStats()],
      ),
    );
  }

  //Styling

  final StyleClass userCardStyle = StyleClass()
    ..height(150)
    ..padding(horizontal: 20.0, vertical: 10)
    ..align('center')
    ..backgroundColor('#3977FF')
    ..borderRadius(all: 20.0)
    ..elevation(10, color: '#3977FF');

  final StyleClass userImageStyle = StyleClass()
    ..height(50)
    ..width(50)
    ..margin(right: 10.0)
    ..borderRadius(all: 30)
    ..backgroundColor('ffffff');

  final StyleClass userStatsStyle = StyleClass()..margin(vertical: 10.0);

  final TextStyle nameTextStyle = TextStyle(
      color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

  final TextStyle nameDescriptionTextStyle =
      TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12.0);
}

class ActionsRow extends StatelessWidget {
  Widget _buildActionsItem(String title, IconData icon) {
    return Division(
      style: actionsItemStyle,
      child: Column(
        children: <Widget>[
          Division(
            style: actionsItemIconStyle,
            child: Icon(
              icon,
              size: 20,
              color: Color(0xFF42526F),
            ),
          ),
          Text(
            title,
            style: actionsItemTextStyle,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildActionsItem('Wallet', Icons.attach_money),
        _buildActionsItem('Delivery', Icons.card_giftcard),
        _buildActionsItem('Message', Icons.message),
        _buildActionsItem('Service', Icons.room_service),
      ],
    );
  }

  final StyleClass actionsItemIconStyle = StyleClass()
    ..width(45)
    ..height(45)
    ..margin(bottom: 5)
    ..borderRadius(all: 30)
    ..backgroundColor('#F6F5F8');

  final StyleClass actionsItemStyle = StyleClass()..margin(vertical: 20.0);

  final TextStyle actionsItemTextStyle =
      TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12);
}

class Settings extends StatelessWidget {
  Widget _buildSettingsItem(
      IconData icon, dynamic iconBgColor, String title, String description) {
    return Division(
      style: settingsItemStyle,
      child: Row(
        children: <Widget>[
          Division(
            style: StyleClass()
              ..backgroundColor(iconBgColor)
              ..add(settingsItemIconStyle),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: itemTitleTextStyle,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                description,
                style: itemDescriptionTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Division(
      style: settingsStyle,
      child: Column(
        children: <Widget>[
          _buildSettingsItem(Icons.location_on, '#8D7AEE', 'Address',
              'Ensure your harvesting address'),
          _buildSettingsItem(
              Icons.lock, '#F468B7', 'Privacy', 'System permission change'),
          _buildSettingsItem(
              Icons.menu, '#FEC85C', 'General', 'Basic functional settings'),
          _buildSettingsItem(Icons.notifications, '#5FD0D3', 'Notifications',
              'Take over the news in time'),
        ],
      ),
    );
  }

  final StyleClass settingsStyle = StyleClass();

  final StyleClass settingsItemStyle = StyleClass()
    ..height(70)
    ..margin(vertical: 10)
    ..padding(left: 15)
    ..borderRadius(all: 15)
    ..backgroundColor('#ffffff')
    ..elevation(50, color: Colors.grey);

  final StyleClass settingsItemIconStyle = StyleClass()
    ..padding(all: 12)
    ..borderRadius(all: 30);

  final TextStyle itemTitleTextStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  final TextStyle itemDescriptionTextStyle = TextStyle(
      color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 12);
}
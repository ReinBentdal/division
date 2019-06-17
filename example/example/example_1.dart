// App design: https://dribbble.com/shots/6459693-Creative-layout-design

import 'package:division/division.dart';
import 'package:flutter/material.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: UserPage()),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  Widget _buildTitle(String title) {
    return Division(
      style: StyleClass()
        ..margin(bottom: 20.0)
        ..alignChild('left'),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Division(
        style: StyleClass()..margin(vertical: 30, horizontal: 20),
        child: Column(
          children: <Widget>[
            _buildTitle('User settings'),
            UserCard(),
            ActionsRow(),
            Settings(),
          ],
        ),
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
            SizedBox(
              height: 5,
            ),
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    ..height(175)
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildActionsItem('Wallet', Icons.attach_money),
        _buildActionsItem('Delivery', Icons.card_giftcard),
        _buildActionsItem('Message', Icons.message),
        _buildActionsItem('Service', Icons.room_service),
      ],
    );
  }

  final StyleClass actionsItemIconStyle = StyleClass()
    ..alignChild('center')
    ..width(50)
    ..height(50)
    ..margin(bottom: 5)
    ..borderRadius(all: 30)
    ..backgroundColor('#F6F5F8');

  final StyleClass actionsItemStyle = StyleClass()..margin(vertical: 20.0);

  final TextStyle actionsItemTextStyle =
      TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12);
}

class Settings extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Division(
      style: settingsStyle,
      child: Column(
        children: <Widget>[
          SettingsItem(Icons.location_on, '#8D7AEE', 'Address',
              'Ensure your harvesting address'),
          SettingsItem(
              Icons.lock, '#F468B7', 'Privacy', 'System permission change'),
          SettingsItem(
              Icons.menu, '#FEC85C', 'General', 'Basic functional settings'),
          SettingsItem(Icons.notifications, '#5FD0D3', 'Notifications',
              'Take over the news in time'),
          SettingsItem(Icons.question_answer, '#BFACAA', 'Support', 'We are here to help'),
        ],
      ),
    );
  }

  final StyleClass settingsStyle = StyleClass();
}

class SettingsItem extends StatefulWidget {

  final IconData icon;
  final String iconBgColor;
  final String title;
  final String description;

  SettingsItem(this.icon, this.iconBgColor, this.title, this.description);

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Division(
      style: settingsItemStyle
        ..elevation(pressed ? 0 : 50, color: Colors.grey)
        ..scale(pressed ? 0.95 : 1.0),
      gesture: GestureClass()
        ..onTapDown((details) => setState(() => pressed = true))
        ..onTapUp((details) => setState(() => pressed = false))
        ..onTapCancel(() => setState(() => pressed = false))
        ,
      child: Row(
        children: <Widget>[
          Division(
            style: StyleClass()
              ..backgroundColor(widget.iconBgColor)
              ..add(settingsItemIconStyle),
            child: Icon(
              widget.icon,
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
                widget.title,
                style: itemTitleTextStyle,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.description,
                style: itemDescriptionTextStyle,
              ),
            ],
          )
        ],
      )
    );
  
  }

  final StyleClass settingsItemStyle = StyleClass()
    ..alignChild('center')
    ..height(70)
    ..margin(vertical: 10)
    ..borderRadius(all: 15)
    ..backgroundColor('#ffffff')
    ..animate(300, Curves.easeOut);

  final StyleClass settingsItemIconStyle = StyleClass()
    ..margin(left: 15)
    ..padding(all: 12)
    ..borderRadius(all: 30);

  final TextStyle itemTitleTextStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  final TextStyle itemDescriptionTextStyle = TextStyle(
      color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 12);
}
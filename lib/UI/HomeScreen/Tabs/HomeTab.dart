import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_muhammad/Components/MainAppButton.dart';
import 'package:test_muhammad/StateManagment/AppSettingsProvider.dart';
import 'package:test_muhammad/Utility/ThemeOf.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    var appSettings = Provider.of<AppSettingsProvider>(context, listen: false);
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox.shrink(),
          SizedBox.shrink(),
          MainAppButton(label:"Start Search",onPressed:(){} ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox.shrink(),
              SizedBox.shrink(),
              Container(
                child: Center(
                    child: Text(
                      "Dark Mode",
                  textAlign: TextAlign.center,
                  style: theme(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                )),
                height: width / 5,
                width: width / 3.4,
                decoration: BoxDecoration(
                    color: Colors.blue.shade600,
                    borderRadius: BorderRadius.circular(18)),
              ),
              SizedBox.shrink(),
              Container(
                width: 100,
                height: 40,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    color: theme(context).accentColor,
                    borderRadius: BorderRadius.circular(32)),
                child: Switch(
                  activeColor: theme(context).backgroundColor,
                  activeTrackColor: theme(context).accentColor,
                  focusColor: theme(context).backgroundColor,
                  inactiveThumbColor: theme(context).backgroundColor,
                  inactiveTrackColor: theme(context).accentColor,
                  value: appSettings.isDarkMode,
                  onChanged: (bool value) => setState(() => value
                      ? appSettings.setModeDark()
                      : appSettings.setModeLight()),
                ),
              ),
              SizedBox.shrink(),
              SizedBox.shrink(),
            ],
          ),
          SizedBox.shrink(),
        ],
      ),
    );
  }
}

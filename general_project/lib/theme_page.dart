import 'package:flutter/material.dart';

enum ThemeEnum { Light, Dark, Blue }

class AppTheme {
  final String name;
  final Color primaryColor;
  final Color backgroundColor;

  AppTheme({required this.name, required this.primaryColor, required this.backgroundColor});
}

AppTheme getTheme(ThemeEnum theme) {
  switch (theme) {
    case ThemeEnum.Light:
      return AppTheme(name: 'Light Theme', primaryColor: Colors.blue, backgroundColor: Colors.white);
    case ThemeEnum.Dark:
      return AppTheme(name: 'Dark Theme', primaryColor: Colors.black, backgroundColor: Colors.grey[900]!);
    case ThemeEnum.Blue:
      return AppTheme(name: 'Blue Theme', primaryColor: Colors.lightBlue, backgroundColor: Colors.blue[100]!);
    default:
      return AppTheme(name: 'Default Theme', primaryColor: Colors.blue, backgroundColor: Colors.white);
  }
}

class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  ThemeEnum _selectedTheme = ThemeEnum.Light;

  @override
  Widget build(BuildContext context) {
    AppTheme currentTheme = getTheme(_selectedTheme);

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTheme.name),
        backgroundColor: currentTheme.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Escolha um Tema',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            for (ThemeEnum theme in ThemeEnum.values) 
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: getTheme(theme).primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedTheme = theme;
                    });
                  },
                  child: Text(getTheme(theme).name),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
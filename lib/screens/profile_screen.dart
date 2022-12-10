import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../widgets/text_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: '');

  @override
  void dispose() {
    // TODO: implement dispose
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context, listen: false);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Hi,   ',
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('ssss');
                        },
                      children: [
                        TextSpan(
                          text: 'Vikas',
                          style: TextStyle(color: color),
                        )
                      ]),
                ),
                TextWidget(color: color, text: 'vikas@gmail.com', textSize: 17),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _listTiles(
                    title: 'Address',
                    subtitle: 'My subtitile',
                    icon: IconlyLight.profile,
                    color: color,
                    onPressed: () async {
                      await _updateAddress();
                    }),
                _listTiles(
                    title: 'Orders',
                    icon: IconlyLight.bag,
                    onPressed: () {},
                    color: color),
                _listTiles(
                    title: 'Wishlist',
                    icon: IconlyLight.heart,
                    onPressed: () {},
                    color: color),
                _listTiles(
                    title: 'Forget Password',
                    icon: IconlyLight.lock,
                    onPressed: () {},
                    color: color),
                _listTiles(
                    title: 'Viewed',
                    icon: IconlyLight.show,
                    onPressed: () {},
                    color: color),
                _listTiles(
                    title: 'Logout',
                    icon: IconlyLight.logout,
                    onPressed: () async {
                      await _logout();
                    },
                    color: color),
                SwitchListTile(
                    title: Text('Switch'),
                    secondary: Icon(themeState.getDarkTheme
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined),
                    value: themeState.getDarkTheme,
                    onChanged: (bool val) {
                      setState(() {
                        themeState.setDarkTheme = val;
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateAddress() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              controller: _addressTextController,
              maxLines: 5,
              decoration: InputDecoration(hintText: 'Your Address'),
              onChanged: (val) {
                print(val);
              },
            ),
            actions: [TextButton(onPressed: () {}, child: Text('Update'))],
          );
        });
  }

  Future<void> _logout() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Sign out'),
            content: Text('Do you wanna Sign out?'),
            actions: [
              TextButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Cancel')),
              TextButton(onPressed: () {}, child: Text('Ok')),
            ],
          );
        });
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(color: color, text: title, textSize: 22),
      subtitle: TextWidget(
          color: color, text: subtitle == null ? '' : subtitle, textSize: 14),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fundr_using_provider/settings/widgets/timepicking.dart';
import 'package:settings_ui/settings_ui.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Color(0xff4b50c7),
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
        child: SettingsList(
          sections: [
            SettingsSection(
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.question_mark),
                  title: const Text('About'),
                  onPressed: (_) {
                    showModalBottomSheet(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        backgroundColor:
                            const Color.fromARGB(255, 237, 238, 255),
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                children: const [
                                  Center(
                                    child: Text(
                                      'Fundr App is made to make your financial calculations and reminder to a bouncing notifier and sound concerning to your daily life.We creaeted this to make a highly compatible user experience and easy adding managing of your money spenting and gaining to your journal.',
                                      style: TextStyle(
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
                SettingsTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notification'),
                  onPressed: (_) {
                    timePicking(context: context);
                  },
                ),
                SettingsTile(
                  onPressed: (context) {
                    _showMyDialog(context);
                  },
                  title: const Text('Reset App'),
                  leading: const Icon(Icons.restart_alt),
                ),
                SettingsTile(
                  onPressed: ((context) {
                    showModalBottomSheet(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        backgroundColor:
                            const Color.fromARGB(255, 237, 238, 255),
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 300,
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                children: const [
                                  Center(
                                    child: Text(
                                      'Fundr App gives you with secured license and acces to store the journal of your money and all transactions with high security and could not accessible for other users or creators of this App. Every transactions and personal notes and categories where only visible and stored by the user\'s own gadets and cant be censored or navigate by anyothers including the providers.',
                                      style: TextStyle(
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
                  title: const Text('Licenses'),
                  leading: const Icon(Icons.security),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Transaction'),
          content: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                Text('Would you like to Reset the App'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Confirm'),
              onPressed: () async {
                // TransactionDb().clearData();
                // CategoryDB().clearCategory();
                // TransactionDb().refresh();
                // final preferences = await SharedPreferences.getInstance();
                // preferences.clear();
                // Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

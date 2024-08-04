import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Profile"),
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      leading: Text('Your profile'),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Edit profile"),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text('Basic Information'),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: Text('Contact Information'),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: Text('Next of kin'),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Security"),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text('Reset password'),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: Text('Reset pin'),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Help Center"),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text('FQA'),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: Text('Privacy policy'),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: Text('About us'),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

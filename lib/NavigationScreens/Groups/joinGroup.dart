import 'package:flutter/material.dart';

class Joingroup extends StatefulWidget {
  const Joingroup({super.key});

  @override
  State<Joingroup> createState() => _JoingroupState();
}

class _JoingroupState extends State<Joingroup> {
  bool fetched = false;
  List<Map<String, dynamic>> Groups = [
    {"Group-Name": "Group 1", "status": "active"},
    {"Group-Name": "Group 2", "status": "active"},
    {"Group-Name": "Group 5", "status": "inactive"},
    {"Group-Name": "Group 3", "status": "inactive"},
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      setState(() {
        fetched = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Groups",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.list),
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  prefixIcon: Icon(Icons.search),
                  hintStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  hintText: 'Search groups',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              fetched
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Groups.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                        0.2), // Shadow color with opacity
                                    spreadRadius:
                                        1, // How much the shadow spreads
                                    blurRadius:
                                        5, // The blur radius of the shadow
                                    offset: Offset(
                                        0, 5), // Offset of the shadow (x, y)
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            Groups[index]['Group-Name'],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Text(
                                            Groups[index]['status'],
                                            style: TextStyle(fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(18),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor: Colors.grey.shade300),
                                    child: Text("Join"))
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}

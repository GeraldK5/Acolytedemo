import 'package:acolyte/NavigationScreens/Groups/creategroup.dart';
import 'package:acolyte/NavigationScreens/Groups/joinGroup.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> Groups = [
    {"Group-Name": "Group 1", "status": "active"},
    {"Group-Name": "Group 2", "status": "active"},
    {"Group-Name": "Group 5", "status": "inactive"},
    {"Group-Name": "Group 3", "status": "inactive"},
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color(0XFF3d4ee6),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Available Balance",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "UGX.20,000",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 17,
                              ),
                              Flexible(
                                child: Text(
                                  "Add money",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_downward,
                                color: Colors.white,
                                size: 17,
                              ),
                              Flexible(
                                child: Text(
                                  "Withdraw",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_circle_down_sharp,
                                size: 17,
                                color: Colors.white,
                              ),
                              Flexible(
                                child: Text(
                                  "Transactions",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Start Saving with friends and Family",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Save together, reach goals faster",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Creategroup())),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Color(0XFF3d4ee6),
                                borderRadius: BorderRadius.circular(14)),
                            child: Text(
                              "Create a Group",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Joingroup()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(14),
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
                              ],
                            ),
                            child: Text(
                              "Join a Group",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "My Saving Group",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Groups.length,
                  itemBuilder: (context, index) => InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "images/diversity.png",
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
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
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                          Divider(
                            color: Colors.grey.shade400,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "My Personal Savings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Groups.length,
                  itemBuilder: (context, index) => InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "images/diversity.png",
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
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
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                          Divider(
                            color: Colors.grey.shade400,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

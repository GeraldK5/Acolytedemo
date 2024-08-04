import 'package:flutter/material.dart';

class GroupDetails extends StatefulWidget {
  Map<String, dynamic> group;
  GroupDetails({super.key, required this.group});

  @override
  State<GroupDetails> createState() => _GroupDetailsState();
}

class _GroupDetailsState extends State<GroupDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group['Group-Name']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color(0XFF3d4ee6),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Total Savings",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "UGX ${widget.group['totalsavings']}",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color(0XFF3d4ee6),
                          borderRadius: BorderRadius.circular(14)),
                      child: Text(
                        "Deposit",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.2), // Shadow color with opacity
                            spreadRadius: 1, // How much the shadow spreads
                            blurRadius: 5, // The blur radius of the shadow
                            offset: Offset(0, 5), // Offset of the shadow (x, y)
                          ),
                        ],
                      ),
                      child: Text(
                        "Emergency",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.2), // Shadow color with opacity
                        spreadRadius: 1, // How much the shadow spreads
                        blurRadius: 5, // The blur radius of the shadow
                        offset: Offset(0, 5), // Offset of the shadow (x, y)
                      ),
                    ],
                  ),
                  child: Text(
                    "Emergency",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Members"),
                  Text(
                    "More members",
                    style: TextStyle(color: Colors.purple),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17)),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.group["members"].length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(
                        'images/profile.png',
                        fit: BoxFit.contain,
                      ),
                      title: Text(widget.group["members"][index]['name']),
                      subtitle: Text(widget.group["members"][index]['role']),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

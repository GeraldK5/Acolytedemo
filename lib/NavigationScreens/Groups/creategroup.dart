import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Creategroup extends StatefulWidget {
  const Creategroup({super.key});

  @override
  State<Creategroup> createState() => _CreategroupState();
}

class _CreategroupState extends State<Creategroup> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController groupname = TextEditingController();
  TextEditingController description = TextEditingController();
  String? _selectedCategory;
  String _privacy = "Private";
  File? _selectedImage;

  Future<void> _showImagePicker() async {
    final picker = ImagePicker();
    final pickedFile = await showDialog<XFile?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select an image'),
          actions: <Widget>[
            TextButton(
              child: Text('Gallery'),
              onPressed: () async {
                Navigator.of(context)
                    .pop(await picker.pickImage(source: ImageSource.gallery));
              },
            ),
            TextButton(
              child: Text('Camera'),
              onPressed: () async {
                Navigator.of(context)
                    .pop(await picker.pickImage(source: ImageSource.camera));
              },
            ),
          ],
        );
      },
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF3d4ee6),
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          "Create Saving Group",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: groupname,
                        decoration: InputDecoration(
                            label: Text("Group name"),
                            hintText: "Enter group name",
                            floatingLabelBehavior:
                                FloatingLabelBehavior.always),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the group name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<String>(
                        value: _selectedCategory,
                        decoration: InputDecoration(
                            label: Text('Group Category'),
                            hintText: "Select group category",
                            floatingLabelBehavior: FloatingLabelBehavior.always
                            // labelText: 'Group Category',
                            ),
                        items: [
                          DropdownMenuItem(
                            value: 'Cash Round',
                            child: Text('Cash Round'),
                          ),
                          DropdownMenuItem(
                            value: 'SACCO Group',
                            child: Text('SACCO Group'),
                          ),
                          DropdownMenuItem(
                            value: 'Lottery Group',
                            child: Text('Lottery Group'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a group category';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: description,
                        maxLines: null,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 40.0, horizontal: 10.0),
                            labelText: 'Description',
                            hintText: "Enter a description",
                            floatingLabelBehavior:
                                FloatingLabelBehavior.always),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Privacy",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          DropdownButton(
                            value: _privacy,
                            items: [
                              DropdownMenuItem(
                                  value: "Private", child: Text("Private")),
                              DropdownMenuItem(
                                  value: "Public", child: Text("Public"))
                            ],
                            onChanged: (value) {
                              setState(() {
                                _privacy = value!;
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: _showImagePicker,
                        child: Container(
                          height: 60,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _selectedImage != null
                                  ? Image.file(
                                      _selectedImage!,
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    )
                                  : Icon(
                                      Icons.add_circle_outlined,
                                      color: Color(0XFF3d4ee6),
                                      size: 35,
                                    ),
                              Text("Select a group photo")
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          GlobalKey<FormState> _form = GlobalKey<FormState>();
                          TextEditingController contribution =
                              TextEditingController();
                          TextEditingController _penalty =
                              TextEditingController();
                          String? _frequency = "Daily";
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              height: MediaQuery.of(context).size.height * 0.5,
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(child: Text("Set Group rules")),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("Contribution"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Form(
                                      key: _form,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DropdownButtonFormField<String>(
                                            value: _frequency,
                                            decoration: InputDecoration(
                                                label: Text('Frequency'),
                                                hintText:
                                                    "Select contibution frequency",
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.always
                                                // labelText: 'Group Category',
                                                ),
                                            items: [
                                              DropdownMenuItem(
                                                value: 'Daily',
                                                child: Text('Daily'),
                                              ),
                                              DropdownMenuItem(
                                                value: 'Weekly',
                                                child: Text('Weekly'),
                                              ),
                                              DropdownMenuItem(
                                                value: 'Monthly',
                                                child: Text('Monthly'),
                                              ),
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedCategory = value;
                                              });
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please select a group category';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: contribution,
                                            decoration: InputDecoration(
                                              hintText: 'UGX 15,000',
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter the contribution amount';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text("Penalties"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            controller: _penalty,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            decoration: InputDecoration(
                                                label: Text(
                                                    "Enter late contribution fine"),
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .always),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter the group name';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.grey.shade300,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15))),
                                                  child: Text("Cancel")),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Color(0XFF3d4ee6),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15))),
                                                  child: Text(
                                                    "Save",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ))
                                            ],
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 60,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.add_circle_outlined,
                                color: Color(0XFF3d4ee6),
                                size: 35,
                              ),
                              Text("Select Group rules")
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(15),
                              fixedSize: Size.fromWidth(
                                  MediaQuery.of(context).size.height * 0.6),
                              backgroundColor: Color(0XFF3d4ee6),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Text(
                            "Create a Group",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

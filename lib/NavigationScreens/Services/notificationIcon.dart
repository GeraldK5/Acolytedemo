import 'package:flutter/material.dart';

class notificationIcon extends StatefulWidget {
  final IconData icon;

  const notificationIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  State<notificationIcon> createState() => _notificationIconState();
}

class _notificationIconState extends State<notificationIcon> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          widget.icon,
          size: 30,
          color: Color(0XFF3d4ee6),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: BoxConstraints(
              minWidth: 12,
              minHeight: 12,
            ),
            child: Center(
              child: Text(
                '5',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:call4help/presentation/widgets/notification_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildCustomAppBar({
  required BuildContext context,

}
    ) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Color(0xFF243b50),

    elevation: 0,
    titleSpacing: 0,
    title: Row(
      children: [
        const SizedBox(width: 8),
        Image.asset(
          "assets/logoCall4help.png",
          width: 40,
          height: 40,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Call4Help",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 16, color: Colors.white),
                  SizedBox(width: 4),
                  Text(
                    "Indore",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () => NotificationPopup.toggle(context),
        icon: const Icon(CupertinoIcons.bell, color: Colors.white),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/track_booking');
        },
        icon: const Icon(CupertinoIcons.location, color: Colors.white),
      ),
      const SizedBox(width: 10),
    ],
  );
}

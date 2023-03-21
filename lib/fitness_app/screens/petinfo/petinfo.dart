import 'package:flutter/material.dart';

class PetInformation extends StatelessWidget {
  const PetInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [],
          ),
          Image.network(
              "https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRPMKnq00NF_T7RusUNeLrSazRZM0S5O8_AOcw2iBTmYTxd3Q7uXf0sW41odpAKqSblKDMUMHGb8nZRo9g"),
          IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "  Name  ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Divider(
                  height: 5,
                  color: Colors.purple,
                  thickness: 2,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                "Breed : ",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              Text("Golden")
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text(
                "Age : ",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              Text("2 years old")
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text(
                "Weight : ",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              Text("10kg")
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text(
                "Gender : ",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              Text("MAILBOX")
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text(
                "GoodBoy : ",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              Text("YES")
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Temperament : ",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          Flexible(
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
          ),
          SizedBox(
            height: 3,
          ),
        ],
      )),
    );
  }
}

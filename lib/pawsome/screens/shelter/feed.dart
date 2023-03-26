import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawsome/pawsome/screens/petinfo/petinfo.dart';

class Post extends StatefulWidget {
  const Post({super.key, required this.snap});
  final snap;
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PetInformation(),
          ),
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRPMKnq00NF_T7RusUNeLrSazRZM0S5O8_AOcw2iBTmYTxd3Q7uXf0sW41odpAKqSblKDMUMHGb8nZRo9g"),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text("sisi",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Image.network(
              "https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRPMKnq00NF_T7RusUNeLrSazRZM0S5O8_AOcw2iBTmYTxd3Q7uXf0sW41odpAKqSblKDMUMHGb8nZRo9g"),
          Row(children: [
            IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.heart),
            ),
            Text("Bestest doggo in the tosswn"),
          ]),
        ],
      ),
    );
  }
}

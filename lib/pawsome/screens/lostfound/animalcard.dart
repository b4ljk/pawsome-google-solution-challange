import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawsome/components/calendar/pawCalTheme.dart';
import 'package:pawsome/main.dart';
import 'package:pawsome/pawsome/screens/lostfound/detailed_lost_animal/main.dart';
import 'package:pawsome/pawsome/theming.dart';

class LostAnimalCard extends StatelessWidget {
  LostAnimalCard(
      {Key? key,
      this.animationController,
      this.animation,
      required this.isLost,
      required this.document})
      : super(key: key);

  final AnimationController? animationController;
  final Animation<double>? animation;
  final bool isLost;
  final DocumentSnapshot document;
  LostAnimal get lostAnimal =>
      LostAnimal.fromJson(document.data() as Map<String, dynamic>);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LostAnimalDetailScreen(
                      lostAnimal: lostAnimal,
                    )),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(4, 4),
                blurRadius: 16,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2,
                      child: Image.network(
                        lostAnimal.picture,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: PawCalTheme.buildLightTheme().backgroundColor,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 8, bottom: 4),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            lostAnimal.name,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '${lostAnimal.lostLocation}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.grey
                                                        .withOpacity(0.8)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 16, top: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      lostAnimal.phone,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      lostAnimal.lostDate,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey.withOpacity(0.8)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, bottom: 8),
                                child: Text(
                                    lostAnimal.description.substring(
                                            0,
                                            min(lostAnimal.description.length,
                                                180)) +
                                        "...",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            Colors.blueGrey.withOpacity(0.9))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(32.0),
                      ),
                      onTap: () {},
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isLost ? Colors.red : HexColor("#6A88E5"),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    offset: const Offset(1.1, 1.1),
                                    blurRadius: 10.0),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4),
                              child: Text(
                                isLost ? "LOST 😟" : "FOUND 😊",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LostAnimal {
  LostAnimal(
      {required this.name,
      required this.lostLocation,
      required this.phone,
      required this.picture,
      required this.lostDate,
      required this.description,
      required this.isLost});
  final String name;
  final lostLocation;
  final phone;
  final picture;
  final lostDate;
  final String description;
  final bool isLost;

  LostAnimal.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        lostLocation = json['lostLocation'],
        phone = json['phone'],
        picture = json['picture'],
        lostDate = json['lostDate'],
        description = json['description'],
        isLost = json['isLost'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'lostLocation': lostLocation,
        'phone': phone,
        'picture': picture,
        'lostDate': lostDate,
        'description': description,
        'isLost': isLost
      };
}

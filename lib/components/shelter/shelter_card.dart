import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawsome/components/calendar/pawCalTheme.dart';
import 'package:pawsome/components/shelter/shelter_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawsome/pawsome/animalShelters/main.dart';
import 'package:pawsome/pawsome/animalShelters/petdetail.dart';

class ShelterItem extends StatelessWidget {
  const ShelterItem({
    Key? key,
    this.animationController,
    this.animation,
    this.callback,
    required this.document,
  }) : super(key: key);

  final VoidCallback? callback;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final DocumentSnapshot document;
  Shelters get shelterData =>
      Shelters.fromJson(document.data() as Map<String, dynamic>);

  @override
  Widget build(BuildContext context) {
    // print all items in documents

    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PetDetail(
                shelterData:
                    Shelters.fromJson(document.data() as Map<String, dynamic>),
              ),
            ),
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
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.7,
                      child: Image.network(
                        shelterData.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: PawCalTheme.buildLightTheme().backgroundColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 8, bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        shelterData.name,
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
                                        Icon(
                                          FontAwesomeIcons.mapPin,
                                          size: 12,
                                          color: PawCalTheme.buildLightTheme()
                                              .primaryColor,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${shelterData.location}',
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
                            padding: const EdgeInsets.only(right: 16, top: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  shelterData.name,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  shelterData.phone,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey.withOpacity(0.8)),
                                ),
                              ],
                            ),
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
                        child: Icon(
                          Icons.favorite_border,
                          color: PawCalTheme.buildLightTheme().primaryColor,
                        ),
                      ),
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

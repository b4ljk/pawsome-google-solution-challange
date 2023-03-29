import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawsome/pawsome/screens/lostfound/animalcard.dart';

class Firestore {
  static final db = FirebaseFirestore.instance;

  static final lostAnimalRef = db
      .collection('lostfound')
      .withConverter<LostAnimal>(
        fromFirestore: (snapshot, _) => LostAnimal.fromJson(snapshot.data()!),
        toFirestore: (lost, _) => lost.toJson(),
      );
}

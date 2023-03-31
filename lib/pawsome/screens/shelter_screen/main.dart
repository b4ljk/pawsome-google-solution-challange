import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:pawsome/pawsome/screens/shelter_screen/shelter_detail/main.dart';
import 'package:pawsome/pawsome/screens/shelter_screen/widget/shelter_component/main.dart';

class ShelterScreen extends StatefulWidget {
  const ShelterScreen({Key? key}) : super(key: key);

  @override
  _ShelterScreenState createState() => _ShelterScreenState();
}

class _ShelterScreenState extends State<ShelterScreen> {
  TextEditingController textController = TextEditingController();
  final List<Map<String, String>> shelters = [
    {
      'logo':
          'https://scontent.fuln8-1.fna.fbcdn.net/v/t39.30808-6/289176957_3180596468846018_9080591028713012960_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=gefHEOBmk1MAX8_1G_X&_nc_ht=scontent.fuln8-1.fna&oh=00_AfDq76u9jtlZPguwlhl7bU-xSJDp1AQrPLEY3QeOZYaHRA&oe=642B10A7',
      'name': 'Aztai savar NGO',
      'location': 'Ulaanbaatar, Mongolia',
    },
    {
      'logo':
          'https://cdn.greensoft.mn/cache/images/b/6/c/5/a/b6c5a6a01360b10aab5565b2865b79522dcbbfa1.jpg',
      'name': 'UB shelter NGO',
      'location': 'Khovd, Mongolia',
    },
    {
      'logo':
          'https://www.shutterstock.com/image-vector/logo-dogs-cats-260nw-1190098948.jpg',
      'name': 'Amitnii uur',
      'location': 'Erdenet, Mongolia',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(top: 4, right: 8, left: 50),
                child: AnimSearchBar(
                  rtl: true,
                  width: 400,
                  textController: textController,
                  onSuffixTap: () {
                    setState(() {
                      textController.clear();
                    });
                  },
                  onSubmitted: (String) {},
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: shelters.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: InkWell(
                      onTap: () => {},
                      child: ShelterComponent(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShelterDetailScreen()),
                          );
                        },
                        logo: shelters[index]['logo']!,
                        name: shelters[index]['name']!,
                        location: shelters[index]['location']!,
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

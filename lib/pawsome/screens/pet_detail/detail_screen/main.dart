import 'package:flutter/material.dart';

class PetsDetailScreen extends StatefulWidget {
  const PetsDetailScreen({Key? key}) : super(key: key);

  @override
  _PetsDetailScreenState createState() => _PetsDetailScreenState();
}

class _PetsDetailScreenState extends State<PetsDetailScreen> {
  int _currentImageIndex = 0;

  final List<String> _images = [
    'https://firebasestorage.googleapis.com/v0/b/pawsome-59b88.appspot.com/o/victor-grabarczyk-N04FIfHhv_k-unsplash.jpg?alt=media&token=9d7b80f8-b97a-451b-b1bc-ee1417f21e57',
    'https://firebasestorage.googleapis.com/v0/b/pawsome-59b88.appspot.com/o/victor-grabarczyk-N04FIfHhv_k-unsplash.jpg?alt=media&token=9d7b80f8-b97a-451b-b1bc-ee1417f21e57',
    'https://firebasestorage.googleapis.com/v0/b/pawsome-59b88.appspot.com/o/victor-grabarczyk-N04FIfHhv_k-unsplash.jpg?alt=media&token=9d7b80f8-b97a-451b-b1bc-ee1417f21e57',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: _images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      _images[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Buddy',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFF2968F),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBadge('2 Years', const Color(0xFFFFEBCD)),
                _buildBadge('25 Lbs', const Color(0xFFE0CDFF)),
                _buildBadge('Knows Sit, Stay', const Color(0xFFFFCDD6)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFF2968F),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Buddy is a golden retriever who loves to play fetch and go on long walks. He is a sweet dog who loves attention and will make a great addition to any family.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Contact',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFF2968F),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'For more information about Buddy, please fill out the form below:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Fill out form'),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFF2968F),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

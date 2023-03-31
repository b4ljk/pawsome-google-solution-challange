import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String image;
  final String title;
  final String summary;
  final String date;
  final List<String> tags;

  const BlogCard({
    Key? key,
    required this.image,
    required this.title,
    required this.summary,
    required this.date,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              height: 220,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              summary,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Colors.grey.withOpacity(0.7),
                ),
                const SizedBox(width: 4),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.local_offer,
                  size: 16,
                  color: Colors.grey.withOpacity(0.7),
                ),
                const SizedBox(width: 4),
                Wrap(
                  spacing: 4,
                  children: tags.map((tag) {
                    return Chip(
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      label: Text(
                        tag,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.withOpacity(0.7),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

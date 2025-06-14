import 'package:flutter/material.dart';
import 'verse_page.dart';
import 'verses.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Topical Memory Verses',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: verseGroups.length,
        itemBuilder: (context, groupIndex) {
          final group = verseGroups[groupIndex];
          final groupTitle = group['groupTitle'];
          final verses = group['verses'] as List<dynamic>;

          return ExpansionTile(
            title: Text(
              groupTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: verses.length,
                itemBuilder: (context, verseIndex) {
                  final verse = verses[verseIndex];
                  return ListTile(
                    title: Text(verse['title']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VersePage(
                            verseTitle: verse['title'],
                            verseContent: verse['content'],
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}

import 'package:crime_stats_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:crime_stats_app/utilities/classes.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kBgClr,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back)),
                  const SizedBox(width: 25),
                  const Text("More Articles", style: TextStyle(fontSize: 22)),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: const InputDecoration(
                  hintText: 'Search.',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, i) => _buildNewsTile(),
                      separatorBuilder: (context, i) => const Divider(),
                      itemCount: 4)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsTile() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('''Abducted Burrabazar 
 jeweller found murdered at...'''),
              SizedBox(height: 20),
              Text("7 hours ago"),
            ],
          ),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[350],
            ),
          ),
        ],
      ),
    );
  }
}

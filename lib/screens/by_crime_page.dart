import 'package:crime_stats_app/utilities/graph_view.dart';
import 'package:flutter/material.dart';

class ByCrime extends StatelessWidget {
  const ByCrime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back)),
                const Text(
                  "   Graphs",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Expanded(
              child: GraphView(),
            ),
          ],
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlaygroundScreen extends StatefulWidget {
  PlaygroundScreen({Key? key}) : super(key: key);

  @override
  _PlaygroundScreenState createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  Map data = {};
  bool isLoading = false;
  String secretKey =
      '\$2b\$10\$TOeSkgYsbk.fF/Ds8ULbrubrlyJtnMlbSKpInrjTYOBDZyve2qyBq';

  Future fetchData() async {
    // return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    setState(() {
      isLoading = true;
    });

    final response = await http.get(
        Uri.parse('https://api.jsonbin.io/b/5e2a6001593fd741856f4ea0'),
        headers: {'secret-key': secretKey});

    if (response.statusCode == 200) {
      if (this.mounted) {
        setState(() {
          isLoading = false;
        });
        print(response.body);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            isLoading ? Text("Loading...") : Text("Loading done.."),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../api/api_service.dart';
import '../api/user_model.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  late List<UserModel>? _usermodel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _usermodel = (await ApiService().getUsers())!;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _usermodel == null || _usermodel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _usermodel!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Text(_usermodel![index].name.toString()),
                            // Text(_usermodel![index].company.toString()),
                            Text(_usermodel![index].deadMan.toString()),
                            Text(_usermodel![index].cause.toString()),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  );
                }));
  }
}

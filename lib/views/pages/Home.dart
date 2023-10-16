import 'package:flutter/material.dart';
import 'package:imt_framework_front/API/models/DishesModel.dart';
import 'package:imt_framework_front/API/models/results/UserRes.dart';
import 'package:imt_framework_front/API/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //late List<DishesModel>? _dishModel = [];
  late UserRes? _userRes;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    //_dishModel = (await ApiService().getDishes())!;
    //Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    _userRes = await ApiService().authUser("test@test.net", "test");
    Future.delayed(const Duration(seconds: 1)).then((value) => print(_userRes));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: Container(),
      /*_dishModel == null || _dishModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _dishModel!.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_dishModel![index].id.toString()),
                    Text(_dishModel![index].title),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_dishModel![index].description),
                    Text(_dishModel![index].image),
                  ],
                ),
              ],
            ),
          );
        },
      ),*/
    );
  }
}
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
  late List<DishesModel>? _dishModel = [];
  late UserRes? _userRes;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _dishModel = (await ApiService().getDishes("eyJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJzZWxmIiwic3ViIjoidGVzdEB0ZXN0Lm5ldCIsImV4cCI6MTY5NzU5NjU1OCwiaWF0IjoxNjk3NTkyOTU4LCJyb2xlcyI6IiJ9.nqigPTn6m9ks2_gULGikeafKm181A6kTj7Hr4k-PKEYx2Rw6KmjWBka_eVLKfvh-q1BenMlgih-PT9jeaSTt3kz-5rQW0UrNwaKKL3PGYAcXAuN1PJroHUak3FCgNNrZ0X4fRDi8mD6jLpyJwBVCUutVtJJ5JOatkFwFEl3GuFNRBdRoTogR4CWMgcElEQQGXIGhZr7dGwmVcbKtaDL8hTF9y3_32ch9n0fRg7Kir-TeRztxHZLn-0Y0PBB-vR9HQPevPv6VGi1ioQZkJyxGX1bNv2kPICiBrC_SndXJp6NUwyjGRC6-u77CcUS7hAidyb2pVXUlc6ZBzwGHUkcPCQ"))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => print(_dishModel?.first.image));
    _userRes = await ApiService().authUser("test@test.net", "test");
    Future.delayed(const Duration(seconds: 1)).then((value) => print(_userRes?.jwt));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),

        //_dishModel = ApiService().getDishes("eyJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJzZWxmIiwic3ViIjoidGVzdEB0ZXN0Lm5ldCIsImV4cCI6MTY5NzU5NjU1OCwiaWF0IjoxNjk3NTkyOTU4LCJyb2xlcyI6IiJ9.nqigPTn6m9ks2_gULGikeafKm181A6kTj7Hr4k-PKEYx2Rw6KmjWBka_eVLKfvh-q1BenMlgih-PT9jeaSTt3kz-5rQW0UrNwaKKL3PGYAcXAuN1PJroHUak3FCgNNrZ0X4fRDi8mD6jLpyJwBVCUutVtJJ5JOatkFwFEl3GuFNRBdRoTogR4CWMgcElEQQGXIGhZr7dGwmVcbKtaDL8hTF9y3_32ch9n0fRg7Kir-TeRztxHZLn-0Y0PBB-vR9HQPevPv6VGi1ioQZkJyxGX1bNv2kPICiBrC_SndXJp6NUwyjGRC6-u77CcUS7hAidyb2pVXUlc6ZBzwGHUkcPCQ"),
      ),
      body: Container(
          
      )
        
    );
  }
}
import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/utils/colors.dart';
import 'package:imt_framework_front/views/utils/pageSeparator.dart';
import 'package:imt_framework_front/views/widgets/appbar/appBar.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<String> fruits = <String>[
    'Delivery',
    'Pick Up',
  ];
  bool _isEnable = false;
  bool _noteVisible = false;
  final List<bool> _selectedButton = <bool>[true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopAppBar(arrowVisible: false, heartVisible: false, title: 'Order'),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(15)),
            child: ToggleButtons(
                selectedColor: Colors.white,
                color: Colors.black,
                highlightColor: AppColors.transparent,
                splashColor: AppColors.transparent,
                focusColor: AppColors.transparent,
                hoverColor: AppColors.transparent,
                fillColor: AppColors.transparent,
                renderBorder: false,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _selectedButton.length; i++) {
                      _selectedButton[i] = i == index;
                    }
                  });
                },
                isSelected: _selectedButton,
                children: List<Widget>.generate(
                    2,
                    (index) => Container(
                        decoration: BoxDecoration(
                          color: _selectedButton[index]
                              ? Colors.amber
                              : AppColors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 160,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          fruits[index],
                          style: TextStyle(fontSize: 20),
                        )))),
          ),
          SizedBox(
            height: 30,
          ),
          Visibility(
            visible: _selectedButton[0],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Delivery Address',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 120,
                        child: TextField(
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          onSubmitted: (text) {
                            setState(() {
                              _isEnable = false;
                            });
                          },
                          enabled: _isEnable,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Visibility(
                    visible: _noteVisible,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Note',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              child: TextField(
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                                onSubmitted: (text) {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                              surfaceTintColor:
                                  MaterialStatePropertyAll(Colors.white),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              side: MaterialStatePropertyAll(
                                  BorderSide(color: Colors.grey))),
                          onPressed: () {
                            setState(() {
                              _isEnable = true;
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit_location_alt_outlined,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'Edit Address',
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          )),
                      SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                              surfaceTintColor:
                                  MaterialStatePropertyAll(Colors.white),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              side: MaterialStatePropertyAll(
                                  BorderSide(color: Colors.grey))),
                          onPressed: () {
                            setState(() {
                              if (_noteVisible) {
                                _noteVisible = false;
                              } else {
                                _noteVisible = true;
                              }
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit_note,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'Add Note',
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ))
                    ],
                  ),
                  PageSeparator(),
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 20),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/order_confirmation_page.dart';
import 'package:imt_framework_front/views/utils/colors.dart';
import 'package:imt_framework_front/views/utils/pageSeparator.dart';
import 'package:imt_framework_front/views/widgets/appbar/appBar.dart';
import 'package:imt_framework_front/views/widgets/favorites/favorites_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget trailingWidget = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: decrementQuantity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            quantity.toString(),
            style: TextStyle(fontSize: 16),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: incrementQuantity,
        ),
      ],
    );

    return Scaffold(
      body: Column(
        children: [
          TopAppBar(arrowVisible: false, heartVisible: false, title: 'Order'),
          Expanded(
            child: ListView(
              children: [
                DeliveryAddressWidget(),
                FavoritesWidget(imagePath: 'assets/images/food.jpg', title: 'Test', description: 'Test',quantitySelector: true,),
                FavoritesWidget(imagePath: 'assets/images/food.jpg', title: 'Test', description: 'Test',quantitySelector: true,),
                FavoritesWidget(imagePath: 'assets/images/food.jpg', title: 'Test', description: 'Test',quantitySelector: true,),
                FavoritesWidget(imagePath: 'assets/images/food.jpg', title: 'Test', description: 'Test',quantitySelector: true,),
                PriceContainer()
              ],
            ),
          ),
          DownBarWithButton()
        ],
      ),
    );
  }
}

class PriceContainer extends StatelessWidget {
  const PriceContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          PageSeparator(),
          SizedBox(height: 20,),
          Row(
            children: [
              Text('Payment Summary',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price',style: TextStyle(
                  fontSize: 18
              ),),
              Text('€ 19.90',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery fee',style: TextStyle(
                  fontSize: 18
              ),),
              Text('€ 2',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),)
            ],
          ),
          PageSeparator(),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total payment',style: TextStyle(
                  fontSize: 18
              ),),
              Text('€ 19.90',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),)
            ],
          ),
          SizedBox(height: 60,),
        ],
      ),
    );
  }
}

class DeliveryAddressWidget extends StatefulWidget {
  const DeliveryAddressWidget({super.key});

  @override
  State<DeliveryAddressWidget> createState() => _DeliveryAddressWidgetState();
}

class _DeliveryAddressWidgetState extends State<DeliveryAddressWidget> {
  List<String> fruits = <String>[
    'Delivery',
    'Pick Up',
  ];
  final List<bool> _selectedButton = <bool>[true, false];
  bool _isEnable = false;
  bool _noteVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
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
                      width: MediaQuery.of(context).size.width - 60,
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
                Visibility(
                  visible: _noteVisible,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
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
        ],
      ),
    );
  }
}

class DownBarWithButton extends StatelessWidget {
  const DownBarWithButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey, //New
              blurRadius: 40.0,
              offset: Offset(0, 10))
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.05,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
        ),
        child:
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) {return OrderConfirmation(balance: 900);}));},
          child: Text('Order',
            style: TextStyle(fontSize: 20, fontFamily: 'Sora', fontWeight: FontWeight.bold),),),
      ),
    );
  }
}

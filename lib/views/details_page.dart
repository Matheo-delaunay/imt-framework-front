import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/widgets/appbar/appBar.dart';

class DetailPage extends StatelessWidget {
  DetailPage({required this.image, Key? key, required this.alergens}) : super(key: key);

  final String image;

  final List<String> alergens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            TopAppBar(arrowVisible: true  ,title: "Detail",heartVisible: true,),
            Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 50, right: 50),
                    child: Column(
                      children: [
                        DetailPageImage(image: image),
                        DetailPageDishName(),
                        DetailPageShortDescription(),
                        DetailPageSeparator(),
                        DetailPageDescriptionTitle(),
                        DetailPageDescription(),
                        DetailPageAlergenTitle(),
                        DetailPageAlergen(alergens: alergens),
                      ],
                    ),
                  ),
                ),
            ),
            DownBarWithButton()
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
      height: 120,
      padding: EdgeInsets.only(bottom: 10),
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
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Price',style: TextStyle(
                        color: Colors.grey,
                      ),),
                      Text('€ 19.90',style: TextStyle(
                        fontSize: 20,
                        color: Colors.amber
                      ),)
                    ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    minimumSize: MaterialStatePropertyAll(
                      Size(MediaQuery.of(context).size.width * 0.65,75)
                    )
                  ),
                  onPressed: () {},
                  child: Text('Add to cart'),),
              ],
            ),
          ),
    );
  }
}

class DetailPageAlergen extends StatelessWidget {
  const DetailPageAlergen({
    super.key,
    required this.alergens,
  });

  final List<String> alergens;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: ListView.builder(
          itemCount: alergens.length,
          itemBuilder: (context, index) {
          return Row(
            children: [
              Text(
                '\u2022',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Text(alergens[index],style: TextStyle(
                fontSize: 18,
                color: Colors.grey
              ),),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DetailPageAlergenTitle extends StatelessWidget {
  const DetailPageAlergenTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          'Classic cheese',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ]);
  }
}

class DetailPageDescription extends StatelessWidget {
  const DetailPageDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          'Classic cheese',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
    ]);
  }
}

class DetailPageDescriptionTitle extends StatelessWidget {
  const DetailPageDescriptionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text(
          'Description',
          style:
          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}

class DetailPageSeparator extends StatelessWidget {
  const DetailPageSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        height: 1,
        decoration: BoxDecoration(
          color: Colors.black12,
        ),
      ),
    );
  }
}

class DetailPageShortDescription extends StatelessWidget {
  const DetailPageShortDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          'Classic cheese',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
    ]);
  }
}

class DetailPageDishName extends StatelessWidget {
  const DetailPageDishName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding:  EdgeInsets.only(top: 20.0),
        child: Text(
          'hello',
          style:
          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}

class DetailPageImage extends StatelessWidget {
  const DetailPageImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .width * 0.50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
    );
  }
}

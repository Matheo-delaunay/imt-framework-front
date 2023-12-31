import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/API/models/DishModel.dart';
import 'package:imt_framework_front/main.dart';
import 'package:imt_framework_front/views/utils/pageSeparator.dart';
import 'package:imt_framework_front/views/widgets/appbar/appBar.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  DetailPage({required this.id, Key? key,}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    DishModel getDishById(){
      return appState.listDishes.firstWhere((element) => id==element.id);
    }


    return Scaffold(
      body: Column(
          children: [
            TopAppBar(arrowVisible: true  ,title: "Detail",heartVisible: true,),
            Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                    child: Column(
                      children: [
                        DetailPageImage(image: getDishById().image),
                        DetailPageDishName(name: getDishById().title),
                        PageSeparator(),
                        DetailPageDescriptionTitle(),
                        DetailPageDescription(description: getDishById().description),
                        DetailPageAlergenTitle(),
                        DetailPageAlergen(alergens: getDishById().allergens),
                      ],
                    ),
                  ),
                ),
            ),
            DownBarWithButton(id: id,)
          ],
        ),
    );
  }
}

class DownBarWithButton extends StatelessWidget {
  const DownBarWithButton({
    super.key, required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    appState.potentielFavorit = id;
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
                        fontSize: 19
                      ),),
                      Text('€ 19.90',style: TextStyle(
                        fontSize: 22,
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

                    fixedSize: MaterialStatePropertyAll(
                      Size(MediaQuery.of(context).size.width * 0.65,75)
                    )
                  ),
                  onPressed: () {appState.addDishToSelected(id);},
                  child: Text('Add to cart',
                    style: TextStyle(fontSize: 20, fontFamily: 'Sora', fontWeight: FontWeight.bold),),),
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
        padding: const EdgeInsets.only(top: 20.0),
        child: Text(
          'Allergenes',
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
    super.key, required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          description,
          style: TextStyle(fontSize: 18, color: Colors.grey,overflow: TextOverflow.ellipsis),
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

class DetailPageDishName extends StatelessWidget {
  const DetailPageDishName({
    super.key, required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding:  EdgeInsets.only(top: 20.0),
        child: Text(
          name,
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
          image: NetworkImage(image),
        ),
      ),
    );
  }
}

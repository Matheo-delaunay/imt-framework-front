import 'package:imt_framework_front/views/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    this.arrowVisible,
    this.cartVisible,
    this.title,
  }) : super(key: key);

  final bool? arrowVisible;
  final bool? cartVisible;
  final String? title;

  @override
  Size get preferredSize => const Size(double.infinity, 72);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22)
        ),
        toolbarHeight: 100.0,
        elevation: 0,
        backgroundColor: AppColors.beige,
        leading: Visibility(
          visible: arrowVisible!,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(title!),
        centerTitle: true,

        actions: <Widget>[
          Visibility( visible: cartVisible!,
              child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const Scaffold(
                          appBar: HomeAppBar(
                            title: 'AppBar',
                            arrowVisible: true,
                            cartVisible: true,
                          )
                        );
                      },
                    ));
                  },
                ),
          )
        ],
      ),
    );
  }

}

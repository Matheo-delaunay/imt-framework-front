import 'package:flutter/material.dart';

class DishCard extends StatefulWidget {
  final String title;
  final String category;
  final String description;
  final String image;
  final double price;

  const DishCard(
      {super.key,
      required this.title,
      required this.category,
      required this.description,
      required this.image,
      required this.price});

  @override
  State<DishCard> createState() => _DishCardState();
}

class _DishCardState extends State<DishCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: const ContinuousRectangleBorder(
        side: BorderSide(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(widget.image),
          const Divider(
            color: Colors.black,
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.category,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.price.toString()),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Ajouter au panier"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kuiz/detail_barang.dart';
import 'groceries.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceryList.length,
      itemBuilder: (BuildContext context, int index){
        return GroceriesCard(groceries : groceryList[index]);
      },
    );
  }
}

class GroceriesCard extends StatelessWidget {
  final Groceries groceries;

  const GroceriesCard({Key? key, required this.groceries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>GroceryDetail(detail: groceries)),
              );
            },
            child: Container(
              height:300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.teal,
                  width:2,
                ),
              ),
              child:PageView.builder(
                itemCount:groceries.productImageUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    groceries.productImageUrls[index],
                    fit: BoxFit.fitWidth,
                  );
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.discount_outlined),
                    SizedBox(width: 8.0),
                    Text(groceries.discount),
                  ]
                ),
                Text(
                  groceries.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 8.0),
                Text(
                  groceries.storeName,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 16.0),
                Text(groceries.description),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time),
                        SizedBox(width: 8.0),
                        Text(groceries.stock),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 8.0),
                        Text(groceries.price),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
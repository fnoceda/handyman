import 'package:flutter/material.dart';

class PricingCard extends StatelessWidget {
  const PricingCard({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> promotions = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
      'Item 6'
    ];
    return Container(
      // padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
        Transform.rotate(
          angle: -0.1,
          child: Container( 
            width: double.infinity,
            height: 200,
            decoration:BoxDecoration(
               borderRadius: BorderRadius.circular(15),
               color: Colors.red
            ),
            child:Text("aland"),
          ),
        ),
        
         Expanded(
           child: ColumDetail(
            promotions: promotions,
                   ),
         ),
      ]),
    );
  }
}

class ColumDetail extends StatelessWidget {
  final List<String> promotions;
  const ColumDetail({super.key, required this.promotions});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // This ensures the column is as tall as its content
        children: 
        [
          // const SizedBox(height: 230),
        ...promotions.map((item) {
                  return ListItemColumn(text: item,);
          }),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}
class ListItemColumn extends StatelessWidget {
  final String text;
  const ListItemColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(text, style: Theme.of(context).textTheme.bodyLarge),
      const Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: SizedBox(
          height: 8,
          child: Divider(
            height: 0.2, // Altura de la línea
            color: Colors.black, // Color de la línea
            thickness: 0.2, // Grosor de la línea
          ),
        ),
      ),
    ]);
  }
}



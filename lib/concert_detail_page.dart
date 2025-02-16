import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/card_provider.dart';

class ConcertDetailPage extends StatefulWidget {
  final Map<String, Object> concertDetail; // named as product in demo video
  const ConcertDetailPage({
    super.key,
    required this.concertDetail,
  });

  @override
  State<ConcertDetailPage> createState() => _ConcertDetailPageState();
}

class _ConcertDetailPageState extends State<ConcertDetailPage> {
  int selectedQuantity = 0;

  void onTap() {
    if (selectedQuantity != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.concertDetail['id'],
          'title': widget.concertDetail['title'],
          'price': widget.concertDetail['price'],
          'imageUrl': widget.concertDetail['imageUrl'],
          'category': widget.concertDetail['category'],
          'quantity': selectedQuantity,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product Added Successfully!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Select Quantity!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Concert Details',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 6.0,
          ),
          Text(widget.concertDetail['title'] as String,
              style: Theme.of(context).textTheme.titleLarge),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
            child: Image.asset(
              widget.concertDetail['imageUrl'] as String,
              fit: BoxFit.fill,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Theme.of(context).colorScheme.primaryFixed),
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '\$${widget.concertDetail['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 50.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.concertDetail['quantity'] as List<int>)
                          .length,
                      itemBuilder: (context, index) {
                        final quantityYouCanAdd = (widget
                            .concertDetail['quantity'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedQuantity = quantityYouCanAdd;
                              });
                            },
                            child: Chip(
                              backgroundColor:
                                  selectedQuantity == quantityYouCanAdd
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context)
                                          .colorScheme
                                          .surfaceContainer,
                              label: Text(
                                quantityYouCanAdd.toString(),
                                style: TextStyle(
                                  color: selectedQuantity == quantityYouCanAdd
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    onPressed: onTap,
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text(
                      'Add to Cart',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(
                        double.infinity,
                        50.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

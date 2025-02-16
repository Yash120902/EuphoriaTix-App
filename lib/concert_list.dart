import 'package:flutter/material.dart';
import 'package:shop_app/concert_card.dart';
import 'package:shop_app/concert_detail_page.dart';
import 'global_variable.dart';

class ConcertList extends StatefulWidget {
  const ConcertList({super.key});

  @override
  State<ConcertList> createState() => _ConcertListState();
}

class _ConcertListState extends State<ConcertList> {
  final List<String> filterList = const [
    'All',
    'Sunburn Festival',
    'Bangr Festival',
    'Lollapalooza India',
    'CAS Gurugram',
    'Coldplay India'
  ];
  late String selectedFilter;

  @override
  void initState() {
    selectedFilter = filterList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(30.0),
      ),
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Concert\nTix',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w900),
                ),
              ),
              const Expanded(
                child: Focus(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filterList.length,
              itemBuilder: (context, index) {
                final filter = filterList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.primaryFixed,
                      side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1)),
                      label: Text(
                        filter,
                        style: TextStyle(
                          color: selectedFilter == filter
                              ? Colors.white
                              : Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 14.0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: concerts.length,
              itemBuilder: (context, index) {
                final concertDetail = concerts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ConcertDetailPage(
                              concertDetail: concertDetail);
                        },
                      ),
                    );
                  },
                  child: ConcertCard(
                    title: concertDetail['title'] as String,
                    price: concertDetail['price'] as double,
                    image: concertDetail['imageUrl'] as String,
                    backgroundColor: index.isEven
                        ? Theme.of(context).colorScheme.inversePrimary
                        : Theme.of(context).colorScheme.primaryFixed,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

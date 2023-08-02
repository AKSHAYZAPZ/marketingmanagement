import 'package:flutter/material.dart';
import 'package:jibin_s_application1/presentation/product_detailed_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: Container(
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.fromLTRB(
                              0, 10, 0, 10),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                          prefixIcon: Icon(Icons.search,
                              color: Colors.grey),
                          hintText: 'Search',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent),
                            borderRadius:
                            BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent),
                            borderRadius:
                            BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        // Set the background color of the button
                        padding: EdgeInsets.all(8.0),
                        // Set the padding of the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Set the border radius of the button
                        ),
                      ),
                      onPressed: () async {

                        // shops  = await HttpService.shopList(widget.id,searchKey,route);
                      },
                      child: Text('Search'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                  child: GestureDetector(
                    onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:  (context) => ProductDetailScreen(),));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey[50],
                      ),
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4QcviVkjXItFoplXnxZBUDaMumTK6PmnY_g&usqp=CAU"),
                            ),
                            color: Colors.grey,
                          ),
                          width: 60,
                          height: 120,
                        ),
                        title: Text('Blue Dart Copper'),
                        subtitle: Text('01345'),
                        trailing: Text('₹5000'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

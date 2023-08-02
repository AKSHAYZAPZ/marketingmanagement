import 'package:flutter/material.dart';
import 'package:jibin_s_application1/presentation/product_list_screen/product_list_screen.dart';

import '../../core/utils/color_constant.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({Key? key,}) : super(key: key);

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBlue700,
        centerTitle: true,
        title: Text('Sub Categories'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                  crossAxisSpacing: 0, // Spacing between columns
                  mainAxisSpacing:0, // Spacing between rows
                ),
                itemCount: 15, // Total number of items in the grid
                itemBuilder: (context, index) {
                  // Replace this with the widget you want to display at each grid item
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListScreen(),));
                    },
                    child: Container(
                      child: Center(
                          child: Column(
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage("https://static.libertyprim.com/files/familles/pomme-large.jpg?1569271834")),
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Vegetable'),
                            ],
                          )
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
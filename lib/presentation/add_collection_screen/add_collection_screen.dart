import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';



class AddCollectionScreen extends StatefulWidget {
  AddCollectionScreen({Key? key, required this.id}) : super(key: key);

  String id;

  @override
  State<AddCollectionScreen> createState() => _AddCollectionScreenState();
}

class _AddCollectionScreenState extends State<AddCollectionScreen> {
  String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String selectedOption  = 'Cash Payment';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBlue700,
        title: Text('Add Collcetion'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'ShopName',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  final toDateselectTemp = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (toDateselectTemp == null) {
                    return;
                  } else {
                    setState(() {
                      date = DateFormat('dd-MM-yyyy').format(toDateselectTemp);
                    });
                  }
                },
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          date,
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final toDateselectTemp = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (toDateselectTemp == null) {
                              return;
                            } else {
                              setState(() {
                                date = DateFormat('dd-MM-yyyy')
                                    .format(toDateselectTemp);
                              });
                            }
                          },
                          child: Icon(
                            Icons.calendar_month,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Amount',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    underline: Container(),
                    hint: Text('Select Payment'),
                    items:  <String>[
                    'Cash Payment',
                    'Online Payment',
                    // Add more options as needed
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(), onChanged:(String? newValue) {
                    setState(() {
                      selectedOption = newValue!;
                    });
                  },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {

              },
              child: Container(
                width: 200,
                height: 40,
                padding: getPadding(left: 9, top: 5, right: 9, bottom: 5),
                decoration: AppDecoration.fillBlue600.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder16),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text(
                      'Pay',
                      style: AppStyle.txtDMSansBoldItalic18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jibin_s_application1/model/all_expense_model.dart';
import 'package:jibin_s_application1/services/service.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/delete_expense_model.dart';
import '../add_expense_screen/add_expense_screen.dart';
import '../bottom_navigation_page/bottom_navigation.dart';

class ExpenseScreen extends StatefulWidget {
  ExpenseScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  String id;

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  bool dataConnection = false;
  AllExpense? allExpense;
  String? fromselectDate;
  String? toselectDate;

  //DateTime firstDayOfMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);
  String fdate = DateFormat('dd-MM-yyyy')
      .format(DateTime(DateTime.now().year, DateTime.now().month, 1));
  String tdate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    checkConnectiVity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddExpense(id: widget.id)),
              );
            },
          ),
          // IconButton(
          //     onPressed: () {
          //       deletePopup();
          //     },
          //     icon: Icon(Icons.delete))
        ],
        backgroundColor: ColorConstant.lightBlue700,
        centerTitle: true,
        title: Text('Expense'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavigationScreen(id: widget.id),
              ),
            );
          },
        ),
      ),
      body: allExpense == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final selctedDatetimetemp = await showDatePicker(
                            context: context,
                            initialDate: DateTime(
                                DateTime.now().year, DateTime.now().month, 1),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (selctedDatetimetemp == null) {
                            return;
                          } else {
                            setState(() {
                              fromselectDate = DateFormat('dd-MM-yyyy')
                                  .format(selctedDatetimetemp);
                              fdate = fromselectDate!;
                              checkConnectiVity();
                            });
                          }
                        },
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.black9003f,
                                spreadRadius: getHorizontalSize(
                                  1,
                                ),
                                blurRadius: getHorizontalSize(
                                  1,
                                ),
                                offset: Offset(
                                  0,
                                  2,
                                ),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: ColorConstant.gray50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  fdate,
                                ),
                              ),
                              Container(
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                ),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorConstant.lightBlue700,
                                ),
                              )
                            ],
                          ),
                        ),
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
                              toselectDate = DateFormat('dd-MM-yyyy')
                                  .format(toDateselectTemp);
                              tdate = toselectDate!;
                              checkConnectiVity();
                            });
                          }
                        },
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.black9003f,
                                spreadRadius: getHorizontalSize(
                                  1,
                                ),
                                blurRadius: getHorizontalSize(
                                  1,
                                ),
                                offset: Offset(
                                  0,
                                  2,
                                ),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: ColorConstant.gray50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  tdate,
                                ),
                              ),
                              Container(
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                ),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorConstant.lightBlue700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: ColorConstant.lightBlue700,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Expense: ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                allExpense!.data.totalExpense,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Reimbursement : ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                allExpense!.data.totalReimbursement,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Balance: ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    allExpense!.data.balance.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: allExpense!.data.expenseDetails.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: ColorConstant.bluelite,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          allExpense!
                                              .data
                                              .expenseDetails[index]
                                              .createdAt,
                                          style:
                                              TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: Icon(
                                            Icons.currency_rupee_rounded,
                                            color: Colors.white,
                                          ),
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            allExpense!
                                                .data
                                                .expenseDetails[index]
                                                .expenseCategory,
                                            style: TextStyle(
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width *0.7,
                                            child: Text(
                                              allExpense!.data
                                                  .expenseDetails[index].remark,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.grey),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                      ),
                                    ),
                                    width: double.infinity,
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            // IconButton(
                                            //   onPressed: () {
                                            //     Navigator.push(
                                            //       context,
                                            //       MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             ExpenseEditingScreen(
                                            //           token: widget.id,
                                            //           expenseId: allExpense!
                                            //               .data
                                            //               .expenseDetails[
                                            //                   index]
                                            //               .expenseId,
                                            //         ),
                                            //       ),
                                            //     );
                                            //   },
                                            //   icon: Icon(
                                            //     Icons.edit,
                                            //     color: Colors.blue,
                                            //   ),
                                            // ),
                                            IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Are you sure?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              Text('Close'),
                                                        ),
                                                        ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                              DeleteExpense
                                                                  deleteExpense =
                                                                  await HttpService.deleteExpenses(
                                                                      widget
                                                                          .id,
                                                                      allExpense!
                                                                          .data
                                                                          .expenseDetails[index]
                                                                          .expenseId);
                                                              setState(() {
                                                                Fluttertoast
                                                                    .showToast(
                                                                  msg: deleteExpense
                                                                      .message,
                                                                  toastLength:
                                                                      Toast
                                                                          .LENGTH_SHORT,
                                                                  gravity:
                                                                      ToastGravity
                                                                          .BOTTOM,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .black,
                                                                  textColor:
                                                                      Colors
                                                                          .white,
                                                                );
                                                                checkConnectiVity();
                                                              });
                                                            },
                                                            child:
                                                                Text('Yes'))
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Container(
                                                        height: 330,
                                                        width: 180,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(image: NetworkImage( allExpense!
                                                        .data
                                                        .expenseDetails[index].file)),
                                                        ),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                          Text('Close'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              icon: Icon(
                                                Icons.image,
                                                color: Colors.lightGreen,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '₹',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              allExpense!
                                                  .data
                                                  .expenseDetails[index]
                                                  .amount,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // style: ListTileStyle.drawer,
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

  checkConnectiVity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      dataConnection = true;
      if (dataConnection == true) {
        getAllExpenses();
        setState(() {});
      }
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            height: 70,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'No Network connection',
                    style: TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      'Retry',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      checkConnectiVity();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  getAllExpenses() async {
    allExpense = await HttpService.getAllExpenses(widget.id, fdate, tdate);
    if (allExpense != null) {
      setState(() {});
    }
  }
}

import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jibin_s_application1/presentation/expense_screen/expense_screen.dart';
import 'package:jibin_s_application1/services/service.dart';
import 'package:jibin_s_application1/theme/app_style.dart';
import 'package:jibin_s_application1/widgets/custom_button.dart';
import 'package:jibin_s_application1/widgets/custom_text_form_field.dart';
import 'core/utils/color_constant.dart';
import 'core/utils/size_utils.dart';
import 'model/expense_detail_model.dart';
import 'model/expense_service_model.dart';

class ExpenseEditingScreen extends StatefulWidget {
  ExpenseEditingScreen({
    Key? key,
    required this.token,
    required this.expenseId,
  }) : super(key: key);

  String token;
  String expenseId;

  @override
  State<ExpenseEditingScreen> createState() => _ExpenseEditingScreenState();
}

class _ExpenseEditingScreenState extends State<ExpenseEditingScreen> {
  var dropdownvalue;
  File? billimage;
  bool dataConnection = false;

  ExpenseService? expenseService;
  GetExpens? getExpens;

  TextEditingController amountController = TextEditingController();

  TextEditingController remarkController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    checkConnectiVity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBlue700,
        centerTitle: true,
        title: Text('Expense'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ExpenseScreen(id: widget.token),
              ),
            );
          },
        ),
      ),
      body:expenseService == null || getExpens == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorConstant.gray300,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: DropdownButton(
                            underline: Container(),
                            value: dropdownvalue,
                            hint: Text('Select expense source',
                                style: AppStyle.txtMontserratRegular14),
                            onChanged: (selecteditem) {
                              setState(() {
                                dropdownvalue = selecteditem;
                              });
                            },
                            items: expenseService == null ?
                                null :
                            expenseService!.data
                                    .map<DropdownMenuItem<String>>((e) {
                                    return DropdownMenuItem<String>(
                                      value: e.id.toString(),
                                      child: Text(e.categoryName),
                                    );
                                  }).toList()
                          )
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(left: 44, top: 10),
                        child: Text("Amount",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtMontserratRegular14),
                      ),
                    ),
                    CustomTextFormField(
                      variant: TextFormFieldVariant.OutlineBlackA700,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Amount';
                        }
                      },
                      textInputType: TextInputType.phone,
                      controller: amountController,
                      margin: getMargin(left: 39, top: 10, right: 42),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(left: 44, top: 10),
                        child: Text("Remark",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtMontserratRegular14),
                      ),
                    ),
                    CustomTextFormField(
                      maxLines: 2,
                      variant: TextFormFieldVariant.OutlineBlackA700,
                      controller: remarkController,
                      margin: getMargin(left: 39, top: 10, right: 42),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 10, right: 30),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Select an image source"),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      billimage =
                                          await _pickImage(ImageSource.camera);
                                      if (billimage != null) {
                                        setState(() {});
                                      }
                                    },
                                    child: Text("Camera"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      billimage =
                                          await _pickImage(ImageSource.gallery);
                                      if (billimage != null) {
                                        setState(() {});
                                      } // Open the gallery
                                    },
                                    child: Text("Gallery"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorConstant.gray300,
                              width: 3.0, // Border width
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: MediaQuery.of(context).size.width * 0.30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: billimage == null
                                        ? NetworkImage(getExpens!.data.file)
                                        : FileImage(File(billimage!.path))
                                            as ImageProvider,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white10,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Upload Bill',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'click here to upload',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                      text: "Submit",
                      margin: getMargin(left: 35, top: 10, right: 35),
                      shape: ButtonShape.RoundedBorder24,
                      fontStyle: ButtonFontStyle.DMSansMedium20WhiteA700,
                      onTap: () async {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          updateExpense();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Future _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final File? file = File(pickedFile.path);
      return file;
    } else {}
  }

  checkConnectiVity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      dataConnection = true;
      if (dataConnection == true) {

        getExpensDetail();
        getExpenseServices();
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

  getExpenseServices() async {
    expenseService = await HttpService.expenseServices(widget.token);
    if (expenseService != null) {
      setState(() {});
    }
  }

  getExpensDetail() async {
    getExpens =
        await HttpService.getExpenseById(widget.token, widget.expenseId);
    if (getExpens != null) {
      setState(() {
        dropdownvalue = getExpens!.data.expenseCategoryId.toString();
        amountController.text = getExpens!.data.amount;
        remarkController.text = getExpens!.data.remark;
      });
    }
  }

  updateExpense()async{
    HttpService.updateExpenseById(context, widget.token, widget.expenseId, dropdownvalue, amountController.text, billimage, remarkController.text);
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:readmore/readmore.dart';

import '../../config/theme.dart';
import '../../widgets/app_bar_title.dart';

class SubscriptionList extends StatefulWidget {
  const SubscriptionList({Key? key}) : super(key: key);

  @override
  State<SubscriptionList> createState() => _SubscriptionListState();
}

class _SubscriptionListState extends State<SubscriptionList> {
  List<String> planList = ["Basic", "Standard", "Premium", "Gold"];

  Razorpay? _razorpay;

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Navigator.pop(context);
    print('Success Response: ${response.paymentId}');

    // homeController.addOrder(paymentType!,productIdS);
    // Fluttertoast.showToast(
    //     msg: "SUCCESS: " + response.paymentId!,
    //     toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: ${response.message}');
    // homeController.addOrder(paymentType!,productIdS);
    /* Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: ${response.walletName}');
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_4sP1JemLPLT9dX',
      'amount': 100,
      'name': 'MultiVendor',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      // 'prefill': {'contact': shippingAddressController!.checkLoginData.value.mobile, 'email': shippingAddressController!.checkLoginData.value.email},
      'prefill': {'contact': "1234567899", 'email': "test@gmail.com"},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay!.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarTitleWidget(
              title: "Plans & Pricing",
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: planList.map((e) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25)),
                        ),
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 550,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  // SizedBox(height: 16,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Center(
                                      child: Container(
                                        height: 4,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            color: AppColors.lineColor2,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(height: 12,),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(e,
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors
                                                        .purpleColor))),
                                      ),
                                      InkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            "assets/icons/cancel.png",
                                            fit: BoxFit.contain,
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8,
                                          top: 0,
                                          bottom: 0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Text("₹1,000",
                                                      style: GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .blackColor))),
                                                ),
                                                Expanded(
                                                  flex: 7,
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("Validity",
                                                              style: GoogleFonts.poppins(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .greyColor6))),
                                                          Text("30 days",
                                                              style: GoogleFonts.poppins(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColors
                                                                          .blackColor))),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 16,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("Users",
                                                              style: GoogleFonts.poppins(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .greyColor6))),
                                                          Text("10",
                                                              style: GoogleFonts.poppins(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColors
                                                                          .blackColor))),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Text("Inclusive of GST",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColors
                                                            .redColor))),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Text("Additional Benefits",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppColors
                                                            .blackColor))),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/icons/right.png",
                                                  fit: BoxFit.contain,
                                                  height: 15,
                                                  width: 15,
                                                  color: AppColors.greenColor1,
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),
                                                Text("Apps for every device",
                                                    style: GoogleFonts.poppins(
                                                        textStyle: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .blackColor))),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/icons/right.png",
                                                  fit: BoxFit.contain,
                                                  height: 15,
                                                  width: 15,
                                                  color: AppColors.greenColor1,
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),
                                                Text("Unlimited users",
                                                    style: GoogleFonts.poppins(
                                                        textStyle: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .blackColor))),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/icons/right.png",
                                                  fit: BoxFit.contain,
                                                  height: 15,
                                                  width: 15,
                                                  color: AppColors.greenColor1,
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),
                                                Text("24/7 customer support",
                                                    style: GoogleFonts.poppins(
                                                        textStyle: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .blackColor))),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Text("Details",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppColors
                                                            .blackColor))),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColors
                                                            .greyColor6))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8,
                                        top: 16,
                                        bottom: 8),
                                    child: InkWell(
                                      onTap: () {
                                        openCheckout();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.blackColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        height: 45,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Center(
                                          child: Text("Buy now",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors
                                                          .whiteColor))),
                                        ),
                                      ),
                                    ),
                                  )
                                  // SizedBox(height: 12,),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(e,
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.purpleColor))),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Validity",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColors
                                                            .greyColor6))),
                                            Text("30 days",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors
                                                            .blackColor))),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Users",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColors
                                                            .greyColor6))),
                                            Text("10",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors
                                                            .blackColor))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Text("₹1,000",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        AppColors.blackColor))),
                                        Text("Inclusive of GST",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        AppColors.redColor))),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: IgnorePointer(
                                      ignoring: true,
                                      child: ReadMoreText(
                                        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                                        trimLines: 2,
                                        callback: null,
                                        // preDataText: "AMANDA",
                                        // preDataTextStyle: TextStyle(fontWeight: FontWeight.w500),
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.blackColor)),
                                        colorClickableText:
                                            AppColors.editTextFocusLabelColor,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: '     View more',
                                        trimExpandedText: ' Show less',
                                      ),
                                    ),
                                  )
                                ],
                                crossAxisAlignment: CrossAxisAlignment.end,
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/icons/lock.png",
                                        fit: BoxFit.contain,
                                        height: 12,
                                        width: 12,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Secure transaction",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppColors.blackColor))),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.blackColor,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    height: 30,
                                    width: 85,
                                    child: Center(
                                      child: Text("Buy now",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColors.whiteColor))),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: AppColors.lineColor,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

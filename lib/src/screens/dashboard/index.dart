import 'package:airpay/src/controllers/dashboard_controller.dart';
import 'package:airpay/src/controllers/profile_controller.dart';
import 'package:airpay/src/controllers/wallet_controller.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:airpay/src/screens/dashboard/widgets/operation.dart';
import 'package:airpay/src/screens/dashboard/widgets/transactions.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({ Key? key }) : super(key: key);
  final DashboardController _dashboardController = Get.put(DashboardController());
  final WalletController _walletController = Get.put(WalletController());
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        height: size.height,
        width: size.width,
        color: kBackgroundColor,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() => Text(
                      _dashboardController.greeting.value,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black87
                      ),
                    )),
                    Obx(() => Text(
                      '${_profileController.name.value}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black87
                      ),
                    )),
                  ]
                )
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  height: size.height / 6,
                  width: size.width * .7,
                  decoration: BoxDecoration(
                    gradient: kOrangeGradient,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() => Text(
                        'NAD ${_walletController.balance.value.toString()}',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      )),
                      const SizedBox(height: 10),
                      Text(
                        'Your balance',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Operations',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
              const SizedBox(height: 7),
              SizedBox(
                height: size.height * .3,
                width: size.width * 1,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    OperationContainer(name: 'Send Money', onPress: () => Navigator.pushNamed(context, 'send_money'), imageUrl: 'assets/icons/dollar-coin-with-right-arrow.svg'),
                    OperationContainer(name: 'Cash Out', onPress: () => Navigator.pushNamed(context, 'cashout_entermerchant'), imageUrl: 'assets/icons/bank.svg'),
                    OperationContainer(name: 'Cash In', onPress: () => Navigator.pushNamed(context, 'cashin'), imageUrl: 'assets/icons/loan.svg'),
                    OperationContainer(name: 'Buy Airtime', onPress: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (builder) {
                          return Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)
                              )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: size.width,
                                  height: size.height / 15,
                                  color: Colors.grey[200],
                                  child: Center(
                                    child: Text(
                                      'Buy Airtime',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black87
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          SizedBox(height: 20),
                                          GestureDetector(
                                            onTap: () => Navigator.pushNamed(context, 'airtime_package'),
                                            child: Text(
                                              'Buy for my number',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 40),
                                          GestureDetector(
                                            onTap: () => Navigator.pushNamed(context, 'enter_otherphone'),
                                            child: Text(
                                              'Buy for another number',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                              ),
                                            ),
                                          ),
                                        ]
                                      )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      );
                    }, imageUrl: 'assets/icons/dollar-coin-with-right-arrow.svg'),
                    OperationContainer(name: 'Buy Data', onPress: (){
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (builder) {
                          return Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)
                              )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: size.width,
                                  height: size.height / 15,
                                  color: Colors.grey[200],
                                  child: Center(
                                    child: Text(
                                      'Buy Data',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black87
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          SizedBox(height: 20),
                                          GestureDetector(
                                            onTap: () => Navigator.pushNamed(context, 'airtime_package'),
                                            child: Text(
                                              'Buy for my number',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 40),
                                          GestureDetector(
                                            onTap: () => Navigator.pushNamed(context, 'enter_otherphone'),
                                            child: Text(
                                              'Buy for another number',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                              ),
                                            ),
                                          ),
                                        ]
                                      )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      );
                    }, imageUrl: 'assets/icons/bank.svg'),
                    OperationContainer(name: 'Pay', onPress: () => Navigator.pushNamed(context, 'paybill'), imageUrl: 'assets/icons/bank.svg')
                  ],
                ),
              ),
              SizedBox(height: 1.0),
              SizedBox(
                height: 60,
                width: size.width,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      )
                    )
                  ),
                  onPressed: () => Navigator.pushNamed(context, 'qrcodescanner'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Scan QR Code',
                        style: TextStyle(
                          fontSize: 20,
                          color: kOrangeMain,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.qr_code_2_outlined,
                        color: kOrangeMain,
                      ),
                    ]
                  ),
                )
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Transactios',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    )
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                  )
                ]
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: size.height * .3,
                width: size.width,
                child: RecentTransaction(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
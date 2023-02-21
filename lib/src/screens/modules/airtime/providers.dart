import 'package:airpay/src/controllers/airtime_controller.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AirtimePackages extends StatefulWidget {
  const AirtimePackages({ Key? key }) : super(key: key);

  @override
  _AirtimePackagesState createState() => _AirtimePackagesState();
}

class _AirtimePackagesState extends State<AirtimePackages> {
  AirtimeController _airtimeController = Get.put(AirtimeController());

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Obx(() => ListView.builder(
              itemCount: _airtimeController.providers.value.providers.length,
              itemBuilder: (builder, index) {
                var provider = _airtimeController.providers.value.providers[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    onTap: () {
                      _airtimeController.selectIndex(index, provider.slug);
                      _onProviderSelected();
                    },
                    tileColor: Colors.grey[300],
                    title: Text(
                      '${provider.name}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20
                      ),
                    ),
                    subtitle: Text(
                      '${provider.type}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15
                      ),
                    ),
                    // ignore: unrelated_type_equality_checks
                    trailing: _airtimeController.selectedIndex.value == index.toString() ? Icon(Icons.check_outlined, size: 30) : null,
                  ),
                );
              },
            )),
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black87
          )
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'Choose Package',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),
      )
    );
  }

  void _onProviderSelected() {
    final Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Color(0xFF737373),
          height: size.height * .8,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )
                  ),
                  child: Center(
                    child: Text(
                      'Packages',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Obx(() => ListView.builder(
                      itemCount: _airtimeController.packages.value.packages.length,
                      itemBuilder: (builder, index) {
                        var package = _airtimeController.packages.value.packages[index];
                        return Obx(() => Container(
                          // ignore: unrelated_type_equality_checks
                          color: (_airtimeController.selectedPackageId.value == package.id) ? kOrangeMain.withOpacity(.5) : null,
                          child: ListTile(
                            enableFeedback: true,
                            // Navigator.pushNamed(context, 'confirmation_password')
                            onTap: () {
                              _airtimeController.selectedPackage(package);
                            },
                            title: Text(
                              '${package.description}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            trailing: Text(
                              '${package.amount}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ));
                      },
                    )),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'enter_airtime_password'),
                    child: Container(
                      width: size.width,
                      height: size.height / 14,
                      decoration: BoxDecoration(
                        gradient: kBlueGradient
                      ),
                      child: Center(
                        child: Text(
                          'Proceed',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
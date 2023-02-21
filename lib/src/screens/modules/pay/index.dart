import 'package:airpay/src/screens/dashboard/widgets/operation.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:flutter/material.dart';

class PaybillScreen extends StatelessWidget {
  const PaybillScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87
          ),
        )
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'enter_business'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: kBlueMain,
                  ),
                  Text(
                    'Enter Paybill Number',
                    style: TextStyle(
                      color: kBlueMain,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: size.width,
              height: size.height / 14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * .4,
                      height: size.height / 16,
                      decoration: BoxDecoration(
                        color: kOrangeMain,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          'My Bills',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * .4,
                      height: size.height /16,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          'Popular Bills',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              flex: 1,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  OperationContainer(name: 'Star times', onPress: (){}, imageUrl: 'assets/icons/loan.svg'),
                  OperationContainer(name: 'Go Tv', onPress: (){}, imageUrl: 'assets/icons/loan.svg'),
                  OperationContainer(name: 'DSTV', onPress: (){}, imageUrl: 'assets/icons/loan.svg'),
                  OperationContainer(name: 'Zuku', onPress: (){}, imageUrl: 'assets/icons/loan.svg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:airpay/src/screens/modules/send_money/widgets/frequently.dart';
import 'package:airpay/src/screens/modules/send_money/widgets/contact_list.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: SizedBox(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black54
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.search_outlined),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none
                        )
                      ),
                    )
                  ),
                )
              ),
              Container(
                height: size.height / 17,
                width: size.width,
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'enter_phone'),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_outlined,
                          size: 25,
                          color: kOrangeMain,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Enter Phone Number',
                          style: TextStyle(
                            color: kOrangeMain,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Frequently Sent',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: FrequentlySent(),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: ContactList(),
              )
            ],
          )
        )
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
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Send Money',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}
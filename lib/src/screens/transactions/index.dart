import 'package:flutter/material.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:airpay/src/screens/transactions/widgets/all.dart';
import 'package:airpay/src/screens/transactions/widgets/income.dart';
import 'package:airpay/src/screens/transactions/widgets/expenses.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({ Key? key }) : super(key: key);

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'This month',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_outlined
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height / 8,
                  width: size.width * .42,
                  decoration: BoxDecoration(
                    color: kBluefadeone,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_drop_down_circle,
                            size: 20,
                          ),
                          Text(
                            'Income', 
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black87
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'N\$ 580.02',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height / 8,
                  width: size.width * .42,
                  decoration: BoxDecoration(
                    color: kOrangeMain,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_drop_down_circle,
                            size: 20,
                          ),
                          Text(
                            'Expenses', 
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black87
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'N\$ 580.02',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: (){},
              child: Text(
                'Hide',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * .7,
                  height: size.height / 17,
                  child: TextFormField(
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
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black87.withOpacity(.7),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/filter.svg',
                        color: Colors.white,
                        width: 20,
                        height: 20,
                      )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TabBar(
                    isScrollable: false,
                    labelColor: Colors.black87,
                    labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                    unselectedLabelColor: Colors.black87,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: kOrangeMain
                    ),
                    controller: _tabController,
                    tabs: [
                      const SizedBox(
                        height: 30,
                        child: Center(
                          child: Text('All'),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                        child: Center(
                          child: Text('Money In'),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                        child: Center(
                          child: Text('Money Out'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                controller: _tabController,
                children: [
                  AllTransactions(),
                  IncomeTransaction(),
                  ExpenseTransaction()
                ],
              )
            )
          ],
        )
      )
    );
  }
}
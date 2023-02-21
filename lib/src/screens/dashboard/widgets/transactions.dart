import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:airpay/src/controllers/request_controller.dart';

class RecentTransaction extends StatelessWidget {
  RecentTransaction({ Key? key }) : super(key: key);
  
  final RequestController _recentController  = Get.put(RequestController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _recentController.recentRequests.value.requests.length,
      itemBuilder: (context, index) {
        var transaction = _recentController.recentRequests.value.requests[index];
        return ListTile(
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8)
            ),
          ),
          title: Text(
            '${transaction.type}',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
          ),
          subtitle: Text(
            '${transaction.lastUpdated}',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.normal,
              fontSize: 15
            ),
          ),
          trailing: Text(
            '${transaction.amount}',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
          ),
        );
      },
    ));
  }
}
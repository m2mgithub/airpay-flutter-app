import 'package:airpay/src/controllers/request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeTransaction extends StatelessWidget {
  IncomeTransaction({ Key? key }) : super(key: key);
  final RequestController _requestController = Get.put(RequestController());
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(thickness: 1);
      },
      itemCount: _requestController.allRequests.value.requests.length,
      itemBuilder: (context, index) {
        var request = _requestController.allRequests.value.requests[index];
        return ListTile(
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8)
            ),
          ),
          title: Text(
            '${request.type}',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 17
            ),
          ),
          subtitle: Text(
            '${request.lastUpdated}',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.normal,
              fontSize: 12
            ),
          ),
          trailing: Text(
            '${request.amount}',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
          ),
        );
      },
    );
  }
}
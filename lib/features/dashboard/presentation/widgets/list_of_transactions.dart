// ignore_for_file: depend_on_referenced_packages

import 'package:expedier_test/core/utils/colors.dart';
import 'package:expedier_test/features/dashboard/domain/transaction.dart';
import 'package:flutter/material.dart';

class ListOfTransactions extends StatelessWidget {
  const ListOfTransactions({
    Key? key,
    required this.transactions,
    this.physics,
    this.scrollController,
  }) : super(key: key);
  final List<Transaction> transactions;
  final ScrollPhysics? physics;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(25.0, 0, 20, 0),
      physics: physics ?? const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.only(right: 15, bottom: 15),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage:
                AssetImage("assets/images/${transactions[index].image}.png"),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2),
              Text(
                transactions[index].name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                transactions[index].date,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text.rich(
                TextSpan(
                  text: "",
                  children: [
                    const TextSpan(
                      text: "+ ",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    TextSpan(
                      text: (transactions[index].amount),
                    ),
                  ],
                ),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                transactions[index].status,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blue,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        );
      },
    );
  }
}

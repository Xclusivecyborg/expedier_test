import 'package:expedier_test/core/utils/helpers.dart';
import 'package:expedier_test/features/dashboard/domain/wallet.dart';
import 'package:expedier_test/features/dashboard/presentation/widgets/balance_card.dart';
import 'package:expedier_test/features/dashboard/presentation/widgets/home_header.dart';
import 'package:expedier_test/features/dashboard/presentation/widgets/home_wallets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Wallet> wallets = [
      Wallet(
        balance: "500.00",
        name: "Canadian Dollar",
        symbol: "cad",
      ),
      Wallet(
        balance: "500.00",
        name: "Canadian Dollar",
        symbol: "ngn",
      ),
      Wallet(
        balance: "500.00",
        name: "Canadian Dollar",
        symbol: "usd",
      ),
      Wallet(
        balance: "500.00",
        name: "Canadian Dollar",
        symbol: "usd",
      ),
      Wallet(
        balance: "500.00",
        name: "Canadian Dollar",
        symbol: "usd",
      ),
    ];
    return SafeArea(
      child: Column(
        children: <Widget>[
          const HomeHeader(),
          const BalanceCard(),
          Expanded(
            child: SizedBox(
              height: Helpers.height(context) * 0.75,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeWalletsWidget(wallets: wallets),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(40, 15, 35, 25),
                      child: Text(
                        "Recent Transactions",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    //  ListOfTransactions(
                    //       transactions: state.transactions.take(7).toList(),
                    //     )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

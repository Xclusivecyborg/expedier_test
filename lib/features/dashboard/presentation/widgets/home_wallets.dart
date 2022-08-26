import 'package:expedier_test/features/dashboard/domain/wallet.dart';
import 'package:expedier_test/features/dashboard/presentation/widgets/wallet_card.dart';
import 'package:flutter/material.dart';

class HomeWalletsWidget extends StatelessWidget {
  const HomeWalletsWidget({
    Key? key,
    required this.wallets,
    this.onTap,
  }) : super(key: key);

  final List<Wallet> wallets;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(25.0, 0, 25, 0),
          child: Text(
            "Wallets",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 30),
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            scrollDirection: Axis.horizontal,
            itemCount: wallets.length,
            itemBuilder: (context, index) {
              return WalletCard(wallet: wallets[index]);
            },
          ),
        ),
      ],
    );
  }
}

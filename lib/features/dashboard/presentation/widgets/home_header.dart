import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage("assets/images/person.png"),
              ),
              SizedBox(width: 10),
              Text(
                "Hi, Jane",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.message,
                  size: 27,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.notifications_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

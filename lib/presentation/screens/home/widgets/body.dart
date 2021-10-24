import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo/config/constants.dart';
import 'package:todo/data/models/user.dart';
import 'package:todo/data/repositories/user_repositories.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: context.read<UserRepository>().getUser(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: SpinKitSpinningLines(color: kPrimaryColor));
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: 'What\'s up ${snapshot.data!.name.split(" ")[0]}\n',
                  style: const TextStyle(fontSize: 24),
                  children: [
                    TextSpan(
                      text: "Today you've 12 tasks",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (ctx, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                      direction: DismissDirection.endToStart,
                      key: Key(index.toString()),
                      background: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFFFE6E6),
                        ),
                        child: Row(
                          children: const [
                            Spacer(),
                            Icon(
                              Icons.delete,
                              color: kPrimaryColor,
                            )
                          ],
                        ),
                      ),
                      child: const ListItem(),
                      onDismissed: (_) {
                        // setState(() {
                        //   demoCarts.removeAt(index);
                        // });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6F9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const ListTile(
        title: Text('Text'),
      ),
    );
  }
}

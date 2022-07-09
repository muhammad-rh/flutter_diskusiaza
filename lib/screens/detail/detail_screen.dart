import 'package:diskusiaza_mobile/screens/detail/detail_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  const DetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<DetailViewModel>(context, listen: false)
          .getThreadById(widget.id, context);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Provider.of<DetailViewModel>(context, listen: false)
              .getThreadById(widget.id, context);
        },
        child: SafeArea(
          child: Column(
            children: [
              Consumer<DetailViewModel>(
                builder: (context, value, child) {
                  if (value.dataState == DataState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (value.dataState == DataState.error) {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }

                  return Column(
                    children: [
                      Text(value.threadDetail!.judul!),
                      Text(
                        value.threadDetail!.isi!,
                        textAlign: TextAlign.justify,
                      ),
                      Text(value.threadDetail!.dilihat.toString()),
                      Text(value.threadDetail!.totalLike!.toString()),
                      Text(value.threadDetail!.kategoriName!),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavbar(
        isHome: false,
        isExplore: false,
        isTrending: false,
        isAccount: false,
      ),
    );
  }
}

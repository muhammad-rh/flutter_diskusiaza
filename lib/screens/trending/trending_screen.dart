import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:diskusiaza_mobile/screens/detail/detail_screen.dart';
import 'package:diskusiaza_mobile/screens/home/home_view_model.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
// import 'package:diskusiaza_mobile/widgets/avatar_pict.dart';
// import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:diskusiaza_mobile/widgets/thread_card.dart';
// import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<ProfileViewModel>(context, listen: false)
          .getDataProfile(context);
      await Provider.of<HomeViewModel>(context, listen: false)
          .getAllThread(context);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<HomeViewModel>(context, listen: false)
              .getAllThread(context);
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Consumer<HomeViewModel>(
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

                        return SizedBox(
                          height: height * 0.85,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: DetailScreen(
                                          id: value.allThreadList[index].id!),
                                      type: PageTransitionType.fade,
                                      inheritTheme: true,
                                      ctx: context,
                                    ),
                                  );
                                },
                                child: ThreadCard(
                                  index: index,
                                  id: value.allThreadList[index].id!,
                                  judul: value.allThreadList[index].judul!,
                                  isi: value.allThreadList[index].isi!,
                                  dilihat: value.allThreadList[index].dilihat!,
                                  kategoriName:
                                      value.allThreadList[index].kategoriName!,
                                  authorName:
                                      value.allThreadList[index].authorName!,
                                  totalLike:
                                      value.allThreadList[index].totalLike!,
                                  isLike: value.allThreadList[index].isLike!,
                                  isUser: false,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 4.0);
                            },
                            itemCount: value.allThreadList.length,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavbar(
        isHome: false,
        isExplore: false,
        isTrending: true,
        isAccount: false,
      ),
    );
  }
}

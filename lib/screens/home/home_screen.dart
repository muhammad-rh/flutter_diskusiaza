import 'package:diskusiaza_mobile/screens/detail/detail_screen.dart';
import 'package:diskusiaza_mobile/screens/home/home_view_model.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/avatar_pict.dart';
import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:diskusiaza_mobile/widgets/thread_card.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProfileViewModel>(context, listen: false)
          .getDataProfile(context);
      Provider.of<HomeViewModel>(context, listen: false).getAllThread(context);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final formKey = GlobalKey<FormState>();
              final titleController = TextEditingController();
              final contentController = TextEditingController();

              String dropDownValue = 'Public';

              var items = [
                'Public',
                'Private',
              ];
              return AlertDialog(
                title: SizedBox(
                  width: width,
                  child: Column(
                    children: [
                      const Text('Tulis Kiriman Informasi'),
                      Row(
                        children: [
                          const AvatarPict(
                            urlPict: 'assets/images/fotoProfile.jpg',
                            radiusPict: 20,
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.play_arrow,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(horizontal: 8),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                    color: Colors.black38,
                                    width: 0.8,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child:
                                // DropdownButton(
                                //   value: dropDownValue,
                                //   icon:
                                //       const Icon(Icons.keyboard_arrow_down_rounded),
                                //   items: items.map((items) {
                                //     return DropdownMenuItem(
                                //       value: items,
                                //       child: Text(items),
                                //     );
                                //   }).toList(),
                                //   onChanged: (String? newValue) {
                                //     setState(() {
                                //       dropDownValue = newValue!;
                                //     });
                                //   },
                                // ),
                                Row(
                              children: [
                                const Icon(
                                  Icons.group,
                                  size: 28,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Publik',
                                  style: poppinsRegular(
                                    14,
                                    infoColor,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: titleController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              // validator: (v) {
                              //   if (v!.trim().isEmpty) {
                              //     return 'Please enter something';
                              //   }
                              //   return null;
                              // },
                              decoration: const InputDecoration(
                                hintText: 'Judul...',
                              ),
                            ),
                            TextFormField(
                              controller: contentController,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.multiline,
                              maxLines: 10,
                              // validator: (v) {
                              //   if (v!.trim().isEmpty) {
                              //     return 'Please enter something';
                              //   }
                              //   return null;
                              // },
                              decoration: const InputDecoration(
                                hintText: 'Katakan sesuatu...',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Kategori : ',
                            style: poppinsLight(15, Colors.black),
                          ),
                          DropdownButton(
                            value: dropDownValue,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            items: items.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropDownValue = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.type_specimen_outlined, size: 28),
                              SizedBox(width: 10),
                              Icon(Icons.image, size: 28),
                            ],
                          ),
                          TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(horizontal: 16),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(infoColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                    color: Colors.black38,
                                    width: 0.8,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Provider.of<HomeViewModel>(context,
                                        listen: false)
                                    .postThread(
                                  titleController.text,
                                  contentController.text,
                                  1,
                                  null,
                                  context,
                                );
                              }
                            },
                            child: Text(
                              'Kirimkan',
                              style: poppinsRegular(14, Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),
      bottomNavigationBar: const BottomNavbar(
        isHome: true,
        isExplore: false,
        isTrending: false,
        isAccount: false,
      ),
    );
  }
}

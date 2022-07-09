import 'package:diskusiaza_mobile/screens/home/home_view_model.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreadCard extends StatelessWidget {
  final int index;
  final int id;
  final String judul;
  final String isi;
  final int dilihat;
  final String kategoriName;
  final String authorName;
  final int totalLike;
  final bool isLike;
  final bool isUser;
  const ThreadCard({
    Key? key,
    required this.index,
    required this.id,
    required this.judul,
    required this.isi,
    required this.dilihat,
    required this.kategoriName,
    required this.authorName,
    required this.totalLike,
    required this.isLike,
    required this.isUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          authorName,
                          style: poppinsRegular(14, Colors.black),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.noise_control_off_sharp,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Ikuti',
                          style: poppinsRegular(14, infoColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      judul,
                      style: poppinsMedium(14, Colors.black),
                    ),
                    Text(
                      isi,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 5,
                      style: poppinsLight(13, Colors.black),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Row(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (isUser == true) {
                              await Provider.of<ProfileViewModel>(context,
                                      listen: false)
                                  .postLikeThread(
                                id,
                                index,
                                context,
                              );
                            } else {
                              await Provider.of<HomeViewModel>(context,
                                      listen: false)
                                  .postLikeThread(
                                id,
                                index,
                                context,
                              );
                            }
                          },
                          child: isLike
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.grey,
                                ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isLike
                              ? (totalLike + 1).toString()
                              : (totalLike).toString(),
                          style: poppinsLight(13, Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        const Icon(Icons.remove_red_eye_rounded),
                        const SizedBox(width: 4),
                        Text(
                          dilihat.toString(),
                          style: poppinsLight(13, Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Text(
                  kategoriName,
                  style: poppinsLight(13, Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

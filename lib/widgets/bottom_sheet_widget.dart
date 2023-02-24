import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/theme.dart';

class BottomSheetWidget extends StatelessWidget {
  final List<String>? list;
  final Function(String) onTab;

  BottomSheetWidget({this.list, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 165,
      child: Wrap(
        children: [
          Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Container(
                height: 4,
                width: 35,
                decoration: BoxDecoration(
                    color: AppColors.lineColor2,
                    borderRadius: BorderRadius.circular(2)),
              ),
              Column(
                children: list!.map((e) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          onTab(e);
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
                          child: Text(e,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blackColor))),
                        ),
                      ),
                      // SizedBox(height: 24,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: AppColors.lineColor,
                      ),
                    ],
                  );
                }).toList(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

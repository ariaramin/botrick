import 'package:flutter/material.dart';
import 'package:whiz/config/theme/app_colors.dart';
import 'package:whiz/features/chat/domain/entity/feature.dart';
import 'package:whiz/features/chat/presentation/widgets/chat_item.dart';
import 'package:whiz/features/chat/presentation/widgets/chat_textfield.dart';
import 'package:whiz/features/chat/presentation/widgets/features_item.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        // ListView.builder(
        //   itemCount: 8,
        //   itemBuilder: (context, index) {
        //     return Padding(
        //       padding: index == 7
        //           ? const EdgeInsets.only(top: 14, bottom: 106)
        //           : const EdgeInsets.symmetric(vertical: 14),
        //       child: ChatItem(
        //         text:
        //             "There are many programming languages ​​in the market that are used in designing and building websites, various applications and other tasks. All these languages ​​are popular in their place and in the way they are used, and many programmers learn and use them.",
        //         isUser: index.isEven ? false : true,
        //       ),
        //     );
        //   },
        // ),
        ListView.builder(
          itemCount: Feature.getFeatures().length,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == Feature.getFeatures().length - 1
                  ? const EdgeInsets.only(top: 14, bottom: 106)
                  : const EdgeInsets.symmetric(vertical: 14),
              child: FeaturesItem(
                iconData: Feature.getFeatures()[index].iconData,
                title: Feature.getFeatures()[index].title!,
                descriptions: Feature.getFeatures()[index].descriptions,
              ),
            );
          },
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 18,
          child: ChatTextField(),
        ),
      ],
    );
  }
}

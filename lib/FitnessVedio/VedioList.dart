// ignore_for_file: use_key_in_widget_constructors, unnecessary_import, file_names, library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates list of video players
class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  final List<YoutubePlayerController> _controllers = [
    '-ESQmzDbnL8',
    'hCcF7eF6haQ',
    'E_gYhUSlaUs',
    'oLI4k4Xni6g',
    'sVPYIRF9RCQ',
    'fUXdrl9ch_Q',
    '66z1pngBQ00',
    'EvIpvr5FROw',
    'rI8MaKoL64I',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    ),
  )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommend'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return YoutubePlayer(
            key: ObjectKey(_controllers[index]),
            controller: _controllers[index],
            actionsPadding: const EdgeInsets.only(left: 16.0),
            bottomActions: [
              CurrentPosition(),
              const SizedBox(width: 10.0),
              ProgressBar(isExpanded: true),
              const SizedBox(width: 10.0),
              RemainingDuration(),
              FullScreenButton(),
            ],
          );
        },
        itemCount: _controllers.length,
        separatorBuilder: (context, _) => const SizedBox(height: 10.0),
      ),
    );
  }
}




















































// ignore_for_file: non_constant_identifier_names
//
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class NotificationService {
//
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   void NotificationPermission()async{
//     NotificationSettings settings = await messaging.requestPermission(
//       criticalAlert: true,
//       badge: true,
//       carPlay: true,
//       announcement: true,
//       alert: true,
//       provisional: true,
//       sound: true,
//     );
//     if(settings.authorizationStatus == AuthorizationStatus.authorized){
//       print('Granted Permission');
//     }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
//       print('Granted provisional Permission');
//     }
//     else{
//       print('Dalind Permission');
//     }
//   }
//}
// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
 class PlayPauseIcon extends StatefulWidget {

   double size;
  final Function(bool isPlaying) onTap;
  PlayPauseIcon({super.key, required this.size,required this.onTap});

   @override
   State<PlayPauseIcon> createState() => _PlayPauseIconState();
 }

 class _PlayPauseIconState extends State<PlayPauseIcon> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  void pauseAction(){
    if(isPlaying){
      controller.forward();
    }
    else {
      controller.reverse();
    }
    isPlaying =! isPlaying;
    widget.onTap(isPlaying);
  }

   @override
   Widget build(BuildContext context) {
     return Container(
       width:230,margin: const EdgeInsets.all(4.0),
       child: ElevatedButton(
         style: ElevatedButton.styleFrom(
             elevation: 3,          //elevation of button
             shape: RoundedRectangleBorder( //to set border radius to button
               borderRadius: BorderRadius.circular(25),
             ),
             backgroundColor: Colors.orangeAccent.shade200,
             padding: const EdgeInsets.all(20) //content padding inside button
         ),
         onPressed:pauseAction,
         child: AnimatedIcon(
             icon: AnimatedIcons.play_pause,color: Colors.black,
             progress: controller,
             size: widget.size,
         ),
       ),
     );
   }
 }

















//
// class PlayPauseIcon extends StatefulWidget {
//   final double size;
//   final Function(bool isPlaying) onTap;
//
//   const PlayPauseIcon({
//     Key? key,
//     required this.size,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   _PlayPauseIconState createState() => _PlayPauseIconState();
// }
//
// class _PlayPauseIconState extends State<PlayPauseIcon>
//     with SingleTickerProviderStateMixin {
//     late AnimationController _controller;
//
//   bool _isPlaying = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 300),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _togglePlayPause() {
//     if (_isPlaying) {
//       _controller.reverse();
//     } else {
//       _controller.forward();
//     }
//     _isPlaying = !_isPlaying;
//     widget.onTap(_isPlaying);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _togglePlayPause,
//       child: AnimatedIcon(
//         icon: AnimatedIcons.play_pause,
//         progress: _controller,
//         size: widget.size,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class VideoLessonPage extends StatefulWidget {
  const VideoLessonPage({Key? key}) : super(key: key);

  @override
  State<VideoLessonPage> createState() => _VideoLessonPageState();
}

class _VideoLessonPageState extends State<VideoLessonPage> {
  late String title ,author ;
  late bool isPlaying, isMute;
  final String url = "https://www.youtube.com/watch?v=B_yNdGDOotM";
  late YoutubePlayer youtubePlayer;
  late YoutubePlayerController _controller;
  late String id;

  @override
  void initState() {
    super.initState();
    isMute = false;
    id = YoutubePlayer.convertUrlToId(url)!;
    _controller= YoutubePlayerController(initialVideoId: id,
      flags: YoutubePlayerFlags(autoPlay: true),);
    youtubePlayer= YoutubePlayer(controller: _controller,);
    isPlaying =_controller.value.isPlaying;
    title = _controller.metadata.title;
    author= _controller.metadata.author;
  }

  Widget setTitle(){
    if(_controller.metadata.title!=null) {
      setState(() {
        title = _controller.metadata.title;
      });
      return textBuilder(title);
    }
    else {
      return setTitle();
    }

  }
  Widget setAuthor(){
    if(_controller.metadata.author!=null) {
      setState(() {
        author = _controller.metadata.author;
      });
      return textBuilder(author, color: Colors.pink, fontSize: 25, weight: FontWeight.bold, );
    }
    else {
      return setAuthor();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Youtube Player App'),
      ),
      body: Column(
        children: [
          Container(height: 250, width: 400, color: Colors.pink, child: youtubePlayer,),
          title==null?  setTitle():
          textBuilder(_controller.metadata.title),
          author==null? setAuthor():
          textBuilder(_controller.metadata.author, color: Colors.pink, weight: FontWeight.bold, fontSize: 25),
          buttonRowBuilder()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(isMute)
          {_controller.unMute();}
          else{
            _controller.mute();
          }
          setState(() {
            isMute= !isMute;
          });
        },
        child: isMute?Icon(Icons.volume_off):Icon(Icons.volume_up),
      ),
    );
  }

  textBuilder(String string, {double fontSize = 17, FontWeight weight = FontWeight.normal, Color color = Colors.black})
  {
    return Container(
        margin: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Text(string, style: TextStyle(fontSize: fontSize, fontWeight: weight, color: color),));
  }

  buttonRowBuilder(){
    double size = 35;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            if(_controller.value.position<= Duration(seconds: 10)){
              _controller.seekTo(Duration(seconds: 0));
            }
            else{
              var p = _controller.value.position - Duration(seconds: 10);
              _controller.seekTo(p);
            }

          }, icon: const Icon(Icons.first_page,),iconSize: size,),
        IconButton(
          onPressed: () {
            if(_controller.value.isPlaying)
            {
              _controller.pause();
            }
            else{
              _controller.play();
            }
            setState(() {
              isPlaying= !isPlaying;
            });
          }
          , icon: isPlaying? const Icon(Icons.pause):Icon(Icons.play_arrow),iconSize: size,),
        IconButton(
          onPressed: () {
            var newPostion= _controller.value.position + Duration(seconds: 10);
            _controller.seekTo(newPostion);
          }, icon: const  Icon(Icons.last_page),iconSize: size,),
      ],
    );
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}





















// // import 'package:flutter/material.dart';
// //
// // import 'Presentation/los_view_body.dart';
// // class LosView extends StatelessWidget {
// //   const LosView({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body:LosViewBody(),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intelligent_tutoring_system/core/general%20widgets/custom_appBar.dart';
//
//
//
// class VideoLessonPage extends StatelessWidget {
//   const VideoLessonPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title:' Lesson Video'),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: 200.h,
//               decoration: BoxDecoration(
//                 color: Colors.black12,
//                 borderRadius: BorderRadius.circular(15.r),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     blurRadius: 6,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Center(
//                 child: Icon(
//                   Icons.play_circle_fill,
//                   color: Colors.grey,
//                   size: 50.sp,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.h),
//             Text(
//               "Lesson Title: Introduction to OOP",
//               style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10.h),
//             Text(
//               "In this lesson, we will explore the basics of Object-Oriented Programming (OOP) and its core principles.",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 14.sp, color: Colors.grey),
//             ),
//             SizedBox(height: 20.h),
//             Spacer(),
//             Padding(
//               padding: EdgeInsets.only(bottom: 20.h),
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.r),
//                   ),
//                 ),
//                 child: Text(
//                   "Next Lesson",
//                   style: TextStyle(color: Colors.white, fontSize: 18.sp),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
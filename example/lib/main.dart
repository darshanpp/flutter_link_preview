// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_link_preview/flutter_link_preview.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Flutter Demo',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController _controller;
//   int _index = -1;
//   final List<String> _urls = [
//   ];
//   @override
//   void initState() {
//     _controller = TextEditingController(
//         text:
//             "https://www.bilibili.com/video/BV1F64y1c7hd?spm_id_from=333.851.b_7265706f7274466972737431.12");
//
//
//     getPreviewData();
//     super.initState();
//   }
//
//   getPreviewData() async{
//
//     try {
//       var demo = await LinkPreViewData().getLinkPreviewData(url: 'https://www.youtube.com/watch?v=f9XQD5mf6FY');
//
//       if(demo is WebImageInfo){
//         print('Demo ${demo.image}');
//       }
//
//       if(demo is WebInfo){
//         print('Demo 2 ${demo.image}');
//       }
//
//     }  catch (e) {
//       print('asdjfldsjf ${e.toString()}');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               TextField(controller: _controller),
//               Row(
//                 children: <Widget>[
//                   RaisedButton(
//                     onPressed: () {
//                       setState(() {});
//                     },
//                     child: const Text("get"),
//                   ),
//                   const SizedBox(width: 15),
//                   RaisedButton(
//                     onPressed: () {
//                       _index++;
//                       if (_index >= _urls.length) _index = 0;
//                       _controller.text = _urls[_index];
//                       setState(() {});
//                     },
//                     child: const Text("next"),
//                   ),
//                   const SizedBox(width: 15),
//                   RaisedButton(
//                     onPressed: () {
//                       _controller.clear();
//                     },
//                     child: const Text("clear"),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 15),
//
//               const SizedBox(height: 50),
//               const Text("Custom Builder", style: TextStyle(fontSize: 20)),
//               const Divider(),
//               // _buildCustomLinkPreview(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCustomLinkPreview(BuildContext context) {
//     return FlutterLinkPreview(
//       key: ValueKey("${_controller.value.text}211"),
//       url: _controller.value.text,
//       builder: (info) {
//         if (info == null) return const SizedBox();
//         if (info is WebImageInfo) {
//           return CachedNetworkImage(
//             imageUrl: info.image,
//             fit: BoxFit.contain,
//           );
//         }
//
//         final WebInfo webInfo = info;
//         if (!WebAnalyzer.isNotEmpty(webInfo.title)) return const SizedBox();
//         return Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: const Color(0xFFF0F1F2),
//           ),
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   CachedNetworkImage(
//                     imageUrl: webInfo.icon ?? "",
//                     imageBuilder: (context, imageProvider) {
//                       return Image(
//                         image: imageProvider,
//                         fit: BoxFit.contain,
//                         width: 30,
//                         height: 30,
//                         errorBuilder: (context, error, stackTrace) {
//                           return const Icon(Icons.link);
//                         },
//                       );
//                     },
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       webInfo.title,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ],
//               ),
//               if (WebAnalyzer.isNotEmpty(webInfo.description)) ...[
//                 const SizedBox(height: 8),
//                 Text(
//                   webInfo.description,
//                   maxLines: 5,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//               if (WebAnalyzer.isNotEmpty(webInfo.image)) ...[
//                 const SizedBox(height: 8),
//                 CachedNetworkImage(
//                   imageUrl: webInfo.image,
//                   fit: BoxFit.contain,
//                 ),
//               ]
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

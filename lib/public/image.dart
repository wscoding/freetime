import '../export.dart';
import 'package:http/http.dart' as http;


class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final _picker = ImagePicker();
  final _networkController = TextEditingController();
  TextEditingController _pathEditingController = TextEditingController();
  File? _localImage;
  File? _imageFile;
   String ? _networkImage;


  
Future<bool> checkImage(String imageUrl) async {
  try {
    final response = await http.head(Uri.parse(imageUrl));
    return response.statusCode == 200 &&
        response.headers["content-type"]?.startsWith("image/") == true;
  } catch (e) {
    debugPrint("Error checking image: $e");
    return false;
  }
}



bool isValidUrl(String url) {
  return RegExp(
    r"^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$",
    caseSensitive: false,
    multiLine: false,
  ).hasMatch(url);
}



  Future<void> _pickLocalImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _localImage = File(pickedFile.path);
        _pathEditingController.text = pickedFile.path;
      });
    }
  }
//本地图片
Future<void> _showLocalImage()  async {
  if (_localImage != null) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.file(_localImage!),
            if (_imageFile != null) Image.file(_imageFile!),
          ],
        ),
      ),
    );
  } else if (_imageFile != null) {

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Image.file(_imageFile!),
      ),
    );
  }
}
//网络图片
Future<void> _showNetworkImage() async {
  
  if (_networkImage != null) {
    bool imageLoaded = await checkImage(_networkImage!);
if (imageLoaded) {
  // 图片已加载
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: CachedNetworkImage(
          imageUrl: _networkController.text,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );

} else {
    setState(()  {  
      _networkImage = 
      "https://game.gtimg.cn/images/sg/cp/a20230511sgllq/prop-qchbwq.png";
        });

  // 无法加载图片
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: CachedNetworkImage(
          imageUrl:"https://game.gtimg.cn/images/sg/cp/a20230511sgllq/prop-qchbwq.png",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );

}


  }

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Page'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            readOnly: false,
            controller: _pathEditingController,
            decoration: InputDecoration(
              labelText: 'Local Image',
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: _pickLocalImage,
                  ),
                  IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: _showLocalImage,
                  ),
                ],
              ),
            ),
          ),
          if (_localImage != null)
           // Image.file(_localImage!),


 
      SizedBox(
        width: 200,
        height: 200,
        child: Image.file(_localImage!),
      ),


//           TextField(
//             controller: _networkController,
//             decoration: InputDecoration(
//               labelText: 'Network Image',
//               suffixIcon: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//     IconButton(
//                 icon: Icon(Icons.photo),
//                 onPressed: () async {
// //  
//                   setState(()  {
//                 if (_networkController.text != null && isValidUrl(_networkController.text)) {
//   _networkImage = _networkController.text;
//   print(_networkImage);


//   print("123");

//                 }


//  else  {
//   _networkController.text = "https://game.gtimg.cn/images/sg/cp/a20230511sgllq/prop-qchbwq.png";
// print(_networkImage);
//  }

//                   });
//                     bool imageLoaded = await checkImage(_networkImage!);

//   print(imageLoaded);
//                 },
//               ),

//                   IconButton(
//                     icon: Icon(Icons.visibility),
//                     onPressed: _showNetworkImage,
//                   ),
//                 ],
//               ),
              
          
//             ),
//                    inputFormatters: [
//           FilteringTextInputFormatter.allow(
            
//       RegExp(r"^https?://[^\s]+$"),
//           ),
//         ],
//           ),
if (_networkController.text != null && isValidUrl(_networkController.text)) 

  CachedNetworkImage(
    imageUrl: _networkImage!,
    height: 200.0,
    width: 200.0,

    errorWidget: (context, url, error) => Container(
      width: 200.0,
      height: 200.0,
      child: Center(
        child: Icon(Icons.error),
      ),
    ),
        placeholder: (context, url) => Container(
      width: 200.0,
      height: 200.0,
      child: Center(
        child: Icon(Icons.error),
      ),
    ),
  
  ),


          
        ],
      ),
    );
  }
}
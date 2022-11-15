import 'dart:io';
import 'dart:math';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import './ml/classifier_emotion.dart';
import 'package:logger/logger.dart';
import '../../../constants.dart';
import '../../../theme.dart';

class camera3 extends StatefulWidget {
  camera3({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _camera3 createState() => _camera3();
}

class _camera3 extends State<camera3> {
  MLService _mlService = MLService();
  //FilePickerService _filePickerService = FilePickerService();
  var logger = Logger();

  File? _image;
  final picker = ImagePicker();

  Image? _imageWidget;
  PickedFile? pickedFile;
  img.Image? fox;
  Uint8List? imageData;
  var category;
  PickedFile? imagePath;

  var emo_list = ['행복한', '슬픈','화난','무서운'];
  var emo_list2 = ['happy', 'sad','angry','fear'];
  var random = Random().nextInt(4);

  @override
  void initState() {
    super.initState();
    // _classifier = ClassifierEmotion();
  }

  Future getImage() async {
    pickedFile = await picker.getImage(source: ImageSource.camera,
      imageQuality: 55,
    );

    setState(() {
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(_image!);
      imagePath = pickedFile!;
      imageData = _image!.readAsBytesSync();
      _predict();
      // print(this.category);
    });
  }

  void _predict() async {

    var pred = await _mlService.convertEmotionImage(pickedFile!.path);

    setState(() {
      this.category = pred;
    });
  }

  @override
  Widget build(BuildContext context) {
    String Question = 'Q '+emo_list[random]+' 표정을 지어주세요!';
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 36,
              ),
              Text.rich(
                TextSpan(
                  text: Question,
                  style: textTheme().headline1?.copyWith(
                      color: kSecondaryColor,
                      fontSize: 25,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 36,
              ),
              LoadingImage(imageData),
              SizedBox(
                height: 36,
              ),
              ElevatedButton.icon(
                onPressed:getImage,
                icon:  Icon(Icons.add_a_photo),
                label: Text("사진을 촬영해 주세요!",style: textTheme().headline2?.copyWith(
                    fontSize: 25,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(primary: kPrimaryColor),
              ),
              SizedBox(
                height: 36,
              ),
              Answer(category,emo_list2[random])
            ],
          ),
        )
    );
  }

  Widget LoadingImage(Uint8List? imageData) {
    if (imageData == null) {
      return Center(
        child: Container(
          child: Text(
            '',
            style: TextStyle(
              fontSize: 18,
              color: kSecondaryColor,
            ),
          ),
        ),
      );
    } else if (imageData.length == 0) {
      return Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 5,
            ),
            Text('Loading'),
          ],
        ),
      );
    } else {
      return Image.memory(
        imageData,
        fit: BoxFit.fitWidth,
        height: 300,
        width: 300,
      );
    }
  }
  Widget Answer(String? category,String emotion) {
    if (category== null) {
      return Center(
        child: Container(
          child: Text(
            '',
          ),
        ),
      );
    }
    else if (category == emotion) {
      return Center(
          child: Text.rich(
            TextSpan(
              text: '정답입니다!',
              style: textTheme().headline1?.copyWith(
                  color: kPurple,fontSize: 30,fontWeight: FontWeight.bold),
            ),
          )
      );
    }
    else {
      return Center(
          child: Text.rich(
            TextSpan(
              text: '오답입니다!',
              style: textTheme().headline1?.copyWith(
                  color: kPurple,fontSize: 30,fontWeight: FontWeight.bold),
            ),
          )
      );
    }
  }
}
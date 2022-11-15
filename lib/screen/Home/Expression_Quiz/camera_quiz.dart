import 'dart:io';
import 'package:KDT_SENTIMENTO/screen/Home/Expression_Quiz/quiz_easy.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Expression_Quiz/ml/classifier_emotion.dart';
import 'package:logger/logger.dart';
import '../../../constants.dart';
import '../../../theme.dart';


class camera extends StatefulWidget {
  camera({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _camera createState() => _camera();
}

class _camera extends State<camera> {
  MLService _mlService = MLService();
  //FilePickerService _filePickerService = FilePickerService();
  var logger = Logger();

  File? _image;
  final picker = ImagePicker();

  Image? _imageWidget;

  img.Image? fox;
  Uint8List? imageData;
  var category;

  @override
  void initState() {

    super.initState();
    // _classifier = ClassifierEmotion();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(_image!);
      imageData = _image!.readAsBytesSync();
      _predict();
      // print(this.category);
    });
  }

  void _predict() async {
    //img.Image imageInput = img.decodeImage(_image!.readAsBytesSync())!;
    //
    // // imageInput = defaultImage!;
    var pred = await _mlService.convertEmotionImage(imageData!);
    setState(() {
      this.category = pred;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon:Icon(Icons.arrow_back,size: 35,)),
                  Text('',style: TextStyle(color: kTextColor,fontSize: 30),)],
              ),
              SizedBox(
                height: 40,
              ),
              Text.rich(
                TextSpan(
                  text: '~~한 표정을 지어봐!',
                  style: textTheme().headline1?.copyWith(
                      color: kTextColor,
                      fontSize: 25,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              LoadingImage(imageData),
              SizedBox(
                height: 100,
              ),
              ElevatedButton.icon(
                onPressed:getImage,
                icon:  Icon(Icons.add_a_photo),
                label: Text("사진을 촬영해 주세요!",style: textTheme().headline2?.copyWith(
                    fontSize: 20,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(primary: kPrimaryColor,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),),
              ),
              SizedBox(
                height: 100,
              ),
              Text.rich(
                TextSpan(
                  text: category == 'sad'
                      ? '정답입니다!'
                      : '',
                  style: textTheme().headline1?.copyWith(
                      color: kPurple,fontSize: 30,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height:50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 50),
                    primary: kBackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => expressLearn1())));
                  },
                  child: Text.rich(
                    TextSpan(
                      text: '다음',
                      style: textTheme().headline2?.copyWith(
                          color: kTextColor,
                          fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  )
                ),
              )
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
}
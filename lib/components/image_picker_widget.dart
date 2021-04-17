import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lidlomiks/components/rounded_button.dart';
import 'package:lidlomiks/components/toast.dart';
import 'package:lidlomiks/constants.dart';

class ImageUploadModel {
  bool isUploaded;
  bool uploading;
  File imageFile;
  String imageUrl;

  ImageUploadModel({
    this.isUploaded,
    this.uploading,
    this.imageFile,
    this.imageUrl,
  });
}

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File image;
  final picker = ImagePicker();


  void _fromGallery() async {
    Navigator.pop(context);
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        Toaster.show('Dodano zdjecie.', toasterType: ToasterType.SUCCESS);
      } else {
        Toaster.show('Nie wybrano żadnego zdjęcia.', toasterType: ToasterType.DANGER);
      }
    });
  }

  void _fromCamera() async {
    Navigator.pop(context);
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        Toaster.show('Dodano zdjecie.', toasterType: ToasterType.SUCCESS);
      } else {
        Toaster.show('Nie wybrano żadnego zdjęcia.', toasterType: ToasterType.DANGER);
      }
    });
  }

  Future _onAddImageClick() async {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) => Container(
        color: kVeryLightGrey,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              text: 'Zrób zdjęcie',
              onClicked: () => _fromCamera(),
            ),
            RoundedButton(
              text: 'Wybierz z galerii',
              onClicked: () => _fromGallery(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: kVeryLightGrey,
          borderRadius: BorderRadius.circular(29)
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.transparent,
        color: kVeryLightGrey,
        child: image == null
          ? IconButton(
              icon: Icon(Icons.add, color: kGrey),
              onPressed: () => _onAddImageClick(),
            )
          : Stack(
              children: <Widget>[
                Image.file(image),
                Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    child: Icon(
                      Icons.remove_circle,
                      size: 20,
                      color: Colors.red,
                    ),
                    onTap: () {
                      setState(() { image = null;});
                    },
                  ),
                ),
              ],
        ),
      ),
    );
  }
}
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lidlomiks/components/rounded_button.dart';
import 'package:lidlomiks/components/toast.dart';
import 'package:lidlomiks/constants.dart';


class ImagePickerWidget extends StatefulWidget {
  final Function updatedFile;

  ImagePickerWidget({
    this.updatedFile,
  });

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File image;

  void _takePhoto(ImageSource imageSource) async {
    Navigator.pop(context);
    PickedFile pickedFile = await ImagePicker().getImage(
      source: imageSource,
      imageQuality: 70,
    );

    if (pickedFile != null) {
      setState(() => image = File(pickedFile.path));
      widget.updatedFile(image);
      Toaster.show('Dodano zdjecie.', toasterType: ToasterType.SUCCESS);
    } else {
      Toaster.show('Nie wybrano żadnego zdjęcia.', toasterType: ToasterType.DANGER);
    }
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
              onClicked: () => _takePhoto(ImageSource.camera),
            ),
            RoundedButton(
              text: 'Wybierz z galerii',
              onClicked: () => _takePhoto(ImageSource.gallery),
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
      padding: EdgeInsets.all(20.0),
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
                      size: 28,
                      color: kPrimaryColor
                    ),
                    onTap: () => setState(() => image = null),
                  ),
                ),
              ],
        ),
      ),
    );
  }
}
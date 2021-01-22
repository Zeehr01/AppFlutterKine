import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../model/media_source.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ListTileWidget.dart';

class CameraButtonWidget extends StatelessWidget {
  Future pickCameraMedia(BuildContext context) async {
    final MediaSource source = ModalRoute.of(context).settings.arguments;

    final getMedia = source == MediaSource.image
        ? ImagePicker().getImage
        : ImagePicker().getVideo;

    final media = await getMedia(source: ImageSource.camera);
    final file = File(media.path);

    Navigator.of(context).pop(file);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (ListTileWidget(
        text: 'From Camera',
        icon: Icons.camera_alt,
        onClicked: () => {pickCameraMedia(context)}));
  }
}

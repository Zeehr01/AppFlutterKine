import '../model/media_source.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'ListTileWidget.dart';

class GalleryButtonWidget extends StatelessWidget {
  Future pickGalleryMedia(BuildContext context) async {
    final MediaSource source = ModalRoute.of(context).settings.arguments;

    final getMedia = source == MediaSource.image
        ? ImagePicker().getImage
        : ImagePicker().getVideo;

    final media = await getMedia(source: ImageSource.gallery);
    final file = File(media.path);

    Navigator.of(context).pop(file);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (ListTileWidget(
        text: 'From Gallery',
        icon: Icons.add_photo_alternate_rounded,
        onClicked: () => pickGalleryMedia(context)));
  }
}

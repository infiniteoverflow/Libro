import 'dart:io';

import 'package:book_donation/Utils/Styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditProfileScreen extends StatefulWidget {
  User user;
  EditProfileScreen(this.user);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  void pickAndUpdateImage() async {
    //Pick an image from the gallery
    final ImagePicker _picker = ImagePicker();
    final XFile _image = await _picker.pickImage(source: ImageSource.gallery);
    //Add image to Firebase storage and get download URL
    firebase_storage.UploadTask uploadTask;
    File file = File(_image.path);
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('profilepictures')
        .child('/${widget.user.uid}.png');
    uploadTask = ref.putFile(file);
    uploadTask.then(
      (event) {
        print("Image uploaded");
      },
    ).catchError(
      (e) {
        print('UploadError : $e');
      },
    );
    var downloadURL = await ref.getDownloadURL().catchError((e) {
      print('Error : $e');
    });
    print(downloadURL.toString());
    //Update image URL in profile
    var url = Uri.parse(downloadURL);
    await widget.user.updateProfile(photoURL: url.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(fontSize: 25.0, fontFamily: 'Jua'),
        ),
        // centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
          ),
          CircleAvatar(
            maxRadius: 60,
            backgroundImage: NetworkImage(
                '${widget.user.photoURL ?? 'https://cdn.icon-icons.com/icons2/2120/PNG/512/user_account_person_avatar_icon_131248.png'}'),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: pickAndUpdateImage,
                icon: Icon(
                  Icons.edit,
                  size: 30,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.user.displayName,
            style: TextStyle(color: Styles.profileBar, fontSize: 17.0),
          ),
          Text(
            widget.user.email,
            style: TextStyle(fontSize: 13, color: Styles.profileBar),
          ),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}

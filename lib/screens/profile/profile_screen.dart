import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/constants/controllers.dart';
import 'package:vocabulary_learning/constants/firebase.dart';
import 'package:vocabulary_learning/models/user.dart';
import 'package:vocabulary_learning/screens/score/ScoreAllScreen.dart';

String getRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;
  UserModel? userModel;
  //  DatabaseReference? userRef;

  File? imageFile;
  bool showLocalFile = false;

  @override
  void initState() {
    super.initState();

    user = auth.currentUser;
    // userModel= authController.userModel.value;

    _getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Container(
        width: size.width,
        height: size.height,
        padding:
            const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 241, 255, 179),
                  Color.fromARGB(255, 242, 255, 207),
                  Color.fromARGB(255, 210, 255, 206),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.2, 0.45, 0.9])),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              const Text(
                'My profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kblack,
                  fontSize: 22,
                  fontFamily: 'PoetsenOne',
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Stack(children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: CircleAvatar(
                  radius: 86,
                  backgroundColor: kredLight,
                  child: CircleAvatar(
                      radius: 80,
                      backgroundImage: showLocalFile
                          ? FileImage(imageFile!) as ImageProvider
                          : userModel!.image == ''
                              ? const NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')
                              : NetworkImage(userModel?.image ?? " ")),
                ),
              ),
            ),
            Positioned(
              left: size.width * 0.5 + 10,
              bottom: 10,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: kredLight,
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    color: kwhite,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.image),
                                  title: const Text('From Gallery'),
                                  onTap: () {
                                    _pickImageFromGallery();
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.camera_alt),
                                  title: const Text('From Camera'),
                                  onTap: () {
                                    _pickImageFromCamera();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
              ),
            )
          ]),
          ProfileItem(
            image: "asset/images/woman.png",
            text: userModel?.name ?? " ",
            background: kYellowLight,
            onClick: () {},
          ),
          const SizedBox(
            height: 16,
          ),
          ProfileItem(
            image: "asset/images/email.png",
            text: userModel?.email ?? " ",
            background: kGreenHightLight,
            onClick: () {},
          ),
          const SizedBox(
            height: 16,
          ),
          ProfileItem(
            image: "asset/images/grade.png",
            text: "My score",
            background: kGreenBold,
            onClick: () {
              Get.to(ScoreAllScreen());
            },
          ),
          const SizedBox(
            height: 16,
          ),
          ProfileItem(
            image: "asset/images/logout_2.png",
            text: "Logout",
            background: kPurpleGrammar,
            onClick: () {
              authController.signOut();
            },
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'asset/images/panda_onboard.png',
              width: size.width * 0.3,
              height: size.width * 0.3,
              fit: BoxFit.cover,
              color: Colors.white.withOpacity(0.8),
              colorBlendMode: BlendMode.modulate,
            ),
          )
        ]),
      ),
    ));
  }

  _getUserDetails() async {
    print("=========================================-----------------");
    userModel = authController.userModel.value;
    print(userModel?.email);
    print(userModel?.name);
    setState(() {});
  }

  _uploadFile(imageFile) async {
    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text('Uploading !!!'),
      message: const Text('Please wait'),
    );
    progressDialog.show();
    try {
      var fileName = (getRandomString(10)) + '.jpg';

      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(fileName)
          .putFile(imageFile!);

      TaskSnapshot snapshot = await uploadTask;

      String profileImageUrl = await snapshot.ref.getDownloadURL();
      print(1542);
      print(profileImageUrl);
      authController.updateImageUrl(profileImageUrl);
      progressDialog.dismiss();
    } catch (e) {
      progressDialog.dismiss();

      print(e.toString());
    }
  }

  _pickImageFromGallery() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (xFile == null) return;

    final tempImage = File(xFile.path);

    imageFile = tempImage;
    showLocalFile = true;
    setState(() {});

    // upload to firebase storage
    _uploadFile(imageFile);
    // ProgressDialog progressDialog = ProgressDialog(
    //   context,
    //   title: const Text('Uploading !!!'),
    //   message: const Text('Please wait'),
    // );
    // progressDialog.show();
    // try {
    //   var fileName = (getRandomString(10)) + '.jpg';

    //   UploadTask uploadTask = FirebaseStorage.instance.ref().child('profile_images').child(fileName).putFile(imageFile!);

    //   TaskSnapshot snapshot = await uploadTask;

    //   String profileImageUrl = await snapshot.ref.getDownloadURL();
    //   print(1542);
    //   print(profileImageUrl);
    //   authController.updateImageUrl(profileImageUrl);
    //   progressDialog.dismiss();
    // } catch (e) {
    //   progressDialog.dismiss();

    //   print(e.toString());
    // }
  }

  _pickImageFromCamera() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (xFile == null) return;

    final tempImage = File(xFile.path);

    imageFile = tempImage;
    showLocalFile = true;
    setState(() {});
    _uploadFile(imageFile);
  }

  String getHumanReadableDate(int dt) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt);

    return DateFormat('dd MMM yyyy').format(dateTime);
  }
}

class ProfileItem extends StatelessWidget {
  final String image;
  final String text;
  final Color background;
  final Function onClick;
  const ProfileItem(
      {Key? key,
      required this.image,
      required this.text,
      required this.background,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  blurRadius: 7,
                  color: Colors.grey.shade500.withOpacity(0.4),
                  offset: const Offset(4, 4))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: 45,
              width: 45,
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              child: Container(
                padding: new EdgeInsets.only(right: 13.0),
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: kblack,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vocabulary_learning/colors.dart';
import 'package:vocabulary_learning/constants/controllers.dart';
import 'package:vocabulary_learning/constants/firebase.dart';
import 'package:vocabulary_learning/models/user.dart';
import 'package:vocabulary_learning/screens/score/ScoreAllScreen.dart';

String getRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
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

  bool isShowcalendar = false;
  // var dateAccumulation =['2022-05-11T00:00:00.000Z','2022-05-27T00:00:00.000Z', '2022-05-16T00:00:00.000Z'];
  var dateAccumulation = [];

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
    print(42);
    print(dateAccumulation);
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
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
                                ? const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGrQoGh518HulzrSYOTee8UO517D_j6h4AYQ&usqp=CAU')
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
              ),
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
        Positioned(
          top: 30,
          right: 5,
          child: InkWell(
            onTap: (() {
              setState(() {
                isShowcalendar = !isShowcalendar;
              });
            }),
            child: CircleAvatar(
              radius: 44,
              backgroundColor: kred,
              child: CircleAvatar(
              radius: 40,
                backgroundImage: AssetImage("asset/images/gift.gif"),
              ),
            ),
          ),
        ),
        if (isShowcalendar)
          Positioned(
              top: size.height * 0.15,
              left: size.width * 0.1,
              child: Container(
                height: size.height * 0.6,
                width: size.width * 0.8,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/board_1.png"), fit: BoxFit.fitHeight)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Attendence table",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kwhite,
                        fontSize: 22,
                        fontFamily: 'PoetsenOne',
                      ),
                    ),
                    TableCalendar(
                      headerStyle: HeaderStyle(formatButtonVisible: false, titleTextStyle: TextStyle(color: Colors.white)),
                      calendarStyle: CalendarStyle(
                        weekendTextStyle: TextStyle(color: Colors.white),
                        defaultTextStyle: TextStyle(color: kBlueGrammar),
                        todayDecoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/tree2.png"), fit: BoxFit.cover)),
                      ),
                      calendarFormat: CalendarFormat.month,
                      firstDay: DateTime.utc(2010, 10, 16),
                      focusedDay: DateTime.now(),
                      lastDay: DateTime.utc(2030, 3, 14),
                      onDaySelected: (date, events) {},
                      selectedDayPredicate: (date) {
                        if (dateAccumulation.indexOf(date.toIso8601String().substring(0, 10)) >= 0) return true;

                        return false;
                      },
                      calendarBuilders: CalendarBuilders(
                        selectedBuilder: ((context, date, focusedDay) {
                          return Container(
                              margin: const EdgeInsets.all(4.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/tree2.png"), fit: BoxFit.cover)),
                              child: Text(
                                date.day.toString(),
                                style: TextStyle(color: kCancelText),
                              ));
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (authController.dateAccumulation.length <= 1)
                      Text(
                        "Fighting. Start a new journey",
                        style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                      )
                    else if (authController.dateAccumulation.length <= 7)
                      Text(
                        "Very good, English is so easy",
                        style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                      )
                    else
                      Text(
                        "You can do it. Try more.",
                        style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                      )
                  ]),
                ),
              ))
      ]),
    ));
  }

  _getUserDetails() async {
    userModel = authController.userModel.value;
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

      UploadTask uploadTask = FirebaseStorage.instance.ref().child('profile_images').child(fileName).putFile(imageFile!);

      TaskSnapshot snapshot = await uploadTask;

      String profileImageUrl = await snapshot.ref.getDownloadURL();
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
  const ProfileItem({Key? key, required this.image, required this.text, required this.background, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration:
            BoxDecoration(color: background, borderRadius: BorderRadius.circular(15), boxShadow: [BoxShadow(blurRadius: 7, color: Colors.grey.shade500.withOpacity(0.4), offset: const Offset(4, 4))]),
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
                  style: const TextStyle(color: kblack, fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

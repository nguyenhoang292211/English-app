import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoading(){
  Get.defaultDialog(
    title: "Loading...",
    content: CircularProgressIndicator(),
    barrierDismissible: false
  );
}

dismissLoadingWidget(){
  // Get.back();
  Navigator.of(Get.overlayContext!).pop(); 
}

showInfoLoading(String message){
    Get.defaultDialog(
    title: message,
    content: CircularProgressIndicator(),
    barrierDismissible: false
  );
}
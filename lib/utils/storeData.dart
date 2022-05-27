import 'package:localstorage/localstorage.dart';

final LocalStorage storage = new LocalStorage('enghlish-app');

addItemsToLocalStorage(key, value) {
  storage.setItem(key, value);
}

getItemFromLocalStorage(key) {
  return storage.getItem(key);
}
clearLocalStorage(){
  storage.clear();
}
const dropdownItems = <String>[
  "--انتخاب کنید--",
  "سراسري",
  "كارداني فني و حرفه اي",
  "كارداني به كارشناسي",
  "دانشگاه جامع علمي و كاربردي (كارداني/كارشناسي)",
  "كارشناسي ارشد",
  "دكتري"
];

int dropdownIntegerItems(String input) {
  int result;
  switch (input) {
    case "--انتخاب کنید--":
      result = 1;
      break;
    case "سراسري":
      result = 2;
      break;
    case "كارداني فني و حرفه اي":
      result = 3;
      break;
    case "كارداني به كارشناسي":
      result = 4;
      break;
    case "دانشگاه جامع علمي و كاربردي (كارداني/كارشناسي)":
      result = 5;
      break;
    case "كارشناسي ارشد":
      result = 6;
      break;
    case "دكتري":
      result = 7;
      break;
    default:
      result = 1;
      break;
  }
  return result;
}

String dropdownStringItems(int input) {
  String result;
  switch (input) {
    case 1:
      result = "--انتخاب کنید--";
      break;
    case 2:
      result = "سراسري";
      break;
    case 3:
      result = "كارداني فني و حرفه اي";
      break;
    case 4:
      result = "كارداني به كارشناسي";
      break;
    case 5:
      result = "دانشگاه جامع علمي و كاربردي (كارداني/كارشناسي)";
      break;
    case 6:
      result = "كارشناسي ارشد";
      break;
    case 7:
      result = "دكتري";
      break;
    default:
      result = "--انتخاب کنید--";
      break;
  }
  return result;
}

class UserBasic {
  final String name, title, departmentName;

  UserBasic({this.name, this.title, this.departmentName});
}

Future<UserBasic> getUserBasicInfo() async {
  await Future.delayed(Duration(seconds: 5));
  return UserBasic(name: '1212', title: "good title", departmentName: "xx bu");
}

class Message {
  // static은 앱이 죽기 전까지 메모리에 있음.
  // 주로 알람어플에 잘 쓰임.
  // 앱 꺼놔도 울릴 수 있도록.
  static String workList = "";
  static String imagePath = "";
  static bool action = false;
  // 계속 남아있는 값을 확인 하기 위한 변수 action
}

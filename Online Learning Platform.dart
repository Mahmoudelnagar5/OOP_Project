// ---------------------
// Enum for Student Level
// ---------------------
enum StudentLevel { Beginner, Intermediate, Advanced }

// ---------------------
// Abstract User Class
// ---------------------
abstract class User {
  late int _id;
  String name;
  String email;

  User({required this.name, required this.email});

  int GetId() => this._id;
  void SetId(int id) => this._id = id;

  void login();
  void logout();
  void updateProfile(String newName, String newEmail);
}

// ---------------------
// Student Class
// ---------------------
class Student extends User {
  List<Course> enrolledCourses = [];
  StudentLevel level;

  Student({
    required super.name,
    required super.email,
    this.level = StudentLevel.Beginner,
  });

  @override
  int GetId() => this._id;

  @override
  void SetId(int id) => this._id = id;

  @override
  void login() => print("$name (Student) logged in with email: $email");

  @override
  void logout() => print("$name (Student) logged out");

  @override
  void updateProfile(String newName, String newEmail) {
    name = newName.isNotEmpty ? newName : name;
    email = newEmail.isNotEmpty ? newEmail : email;
    print("Student profile updated: $name, $email");
  }

  void enroll(Course course) {
    enrolledCourses.add(course);
    print("$name enrolled in course: ${course.title}");
  }
}

// ---------------------
// Instructor Class
// ---------------------
class Instructor extends User {
  List<Course> createdCourses = [];

  Instructor({required super.name, required super.email});

  @override
  void login() => print("${name} (Instructor) logged in with email: $email");

  @override
  void logout() => print("${name} (Instructor) logged out");

  @override
  void SetId(int id) => this._id = id;

  @override
  int GetId() => this._id;

  @override
  void updateProfile(String newName, String newEmail) {
    name = newName.isNotEmpty ? newName : name;
    email = newEmail.isNotEmpty ? newEmail : email;
    print("Instructor profile updated: $name, $email");
  }

  void createCourse(Course course) {
    createdCourses.add(course);
    print("${name} created a new course: ${course.title}");
  }
}

// ---------------------
// Course Class
// ---------------------
class Course {
  static int course_num = 0;
  String title;
  String description;
  Instructor instructor;
  List<Content> contentList = [];
  List<RatingReview> reviews = [];

  Course(this.title, this.description, this.instructor) {
    course_num++;
  }

  void addNewReview(RatingReview newreview) => reviews.add(newreview);
  void addContent(Content content) => contentList.add(content);
  void archive() => print("Course archived");
  void showReviews() => reviews.forEach((r) => print(r.review));
}

// ---------------------
// Abstract Content Class
// ---------------------
abstract class Content {
  String title;

  Content(this.title);

  void display();
}

class Video extends Content {
  int duration;

  Video(String title, this.duration) : super(title);

  @override
  void display() => print("Playing video: $title");
}

class PDF extends Content {
  int pages;

  PDF(String title, this.pages) : super(title);

  @override
  void display() => print("Displaying PDF: $title");
}

class Quiz extends Content {
  int questionCount;

  Quiz(String title, this.questionCount) : super(title);

  @override
  void display() => print("Showing quiz: $title");
}

// ---------------------
// Enrollment Class
// ---------------------
class Enrollment {
  Student student;
  Course course;
  double progress = 0;

  Enrollment(this.student, this.course);

  void updateProgress(double newProgress) => progress = newProgress;
  void markComplete() => print("Course completed");
}

// ---------------------
// Payment Interface
// ---------------------
abstract class Payment {
  void processPayment(double amount);
}

class CreditCardPayment implements Payment {
  @override
  void processPayment(double amount) =>
      print("Paid ${amount} by Credit Card");
}

class PaypalPayment implements Payment {
  @override
  void processPayment(double amount) => print("Paid ${amount} by PayPal");
}

// ---------------------
// Notification Interface
// ---------------------
abstract class Notification {
  void send(String message);
}

class EmailNotification implements Notification {
  @override
  void send(String message) => print("Email: $message");
}

class SMSNotification implements Notification {
  @override
  void send(String message) => print("SMS: $message");
}

// ---------------------
// RatingReview Class
// ---------------------
class RatingReview {
  Student student;
  int rating;
  String review;

  RatingReview(this.student, this.rating, this.review);

  void showReview() => print("Rating: $rating, Review: $review");
}

// ---------------------
// Main Function
// ---------------------
void main() {
  Student student1 = Student(
    name: "Youssef",
    email: "youssed@gmail.com",
    level: StudentLevel.Intermediate,
  );
  student1.SetId(1);

  Instructor instructor1 = Instructor(
    name: 'Amgad',
    email: 'Eng:Amgad@gmail.com',
  );
  instructor1.SetId(123);

  Course course1 = Course('Flutter', 'Mobile Application', instructor1);
  print("course_num  ${Course.course_num}");

  PDF content_course1 = PDF('Dart & Flutter track', 20);
  course1.addContent(content_course1);

  instructor1.createCourse(course1);

  student1.enroll(course1);

  CreditCardPayment cardPayment = CreditCardPayment();
  cardPayment.processPayment(320);

  EmailNotification emailNotification = EmailNotification();
  emailNotification.send('Success enroll course');

  Enrollment enrollment = Enrollment(student1, course1);

  RatingReview course1_rating =
      RatingReview(student1, 100, "very good");
  course1.addNewReview(course1_rating);

  print("Student Level: ${student1.level.name}");
  print(student1.enrolledCourses.first.title);
  print(student1.enrolledCourses.first.description);
  print(student1.GetId());
}

# 📚 Online Learning Platform (OOP Project in Dart)

This project demonstrates a fully object-oriented design of an **online learning platform** (like Udemy or Coursera), implemented in **pure Dart**.  
It simulates real-world entities such as **Students**, **Instructors**, **Courses**, **Content**, **Payments**, and **Notifications** using Dart's powerful OOP features.

---

## 🚀 Features

- 👤 Abstract `User` class (base for Student & Instructor)
- 🎓 `Student` class: enrolls in courses, updates profile, and adds reviews
- 👨‍🏫 `Instructor` class: creates and manages courses
- 📚 `Course` class: holds course content, instructor, and student reviews
- 🎞️ Abstract `Content` class with types:
  - `Video`
  - `PDF`
  - `Quiz`
- 💳 Payment interface with:
  - `CreditCardPayment`
  - `PaypalPayment`
- 📩 Notification interface with:
  - `EmailNotification`
  - `SMSNotification`
- ⭐ `RatingReview` class for course feedback
- 🧭 Enum `StudentLevel` for student progress (Beginner, Intermediate, Advanced)
- ❓ Ternary operator usage inside `updateProfile` method
- 📈 `Enrollment` class to track student progress in each course

---

## 🧠 Concepts Demonstrated

- ✅ Inheritance
- ✅ Abstraction
- ✅ Polymorphism
- ✅ Interfaces
- ✅ Encapsulation
- ✅ Composition
- ✅ Static properties
- ✅ Ternary operators
- ✅ Enums

---

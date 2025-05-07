# 🎓 Student Course Management System

## 📘 Project Description

This project is a SQL-based Student Course Management System developed using DBeaver. It manages students, instructors, courses, and enrollments. The goal is to demonstrate database design, data manipulation, and advanced SQL querying skills.

---

## 🗂️ Database Schema

The database consists of the following tables:

- **Student**: Contains student information.
- **Instructor**: Stores instructor details.
- **Course**: Course catalog linked to instructors.
- **Enrollment**: Tracks student-course registrations with grades.

### Relationships:
- A student can enroll in multiple courses.
- An instructor can teach multiple courses.
- Each enrollment records the grade of a student in a course.

---

## 🏗️ How to Run the Project

### Requirements:
- DBeaver (or any SQL client)
- PostgreSQL 

### Steps:
1. Open DBeaver and connect to your SQL database.
2. Run `coursemanagement.sql` to create the schema.
3. Run `insert_values.sql` to insert sample data.
4. Use `queries.sql` to execute required queries.

---

## 🧠 Key SQL Queries
                              
| Students who enrolled in at least one course     
| Students enrolled in more than two courses       
| Courses with total enrolled students             
| Average grade per course                         
| Students not enrolled in any course              
| Students with their average grade                
| Instructors with number of courses taught        
| Students in courses taught by "John Smith"       
| Top 3 students by average grade                  
| Students failing in more than one course         
| View: student_course_summary                     
| Index on `Enrollment.student_id`                

---

## 📊 Sample Output

- Result of top 3 queries
- View `student_course_summary`
- Index creation success


---

## 🧩 Challenges and Lessons Learned

- Understanding relational integrity and foreign key constraints.
- Designing several tables and feeding data.
- Writing efficient queries using JOINs and aggregations.
- Using views and indexes for performance optimization.

---

## 📤 Submission

The entire project (SQL files + this README) is pushed to GitHub at:

**GitHub Repo**: (https://github.com/The-Gitari/student-course-management.git)

---

## 👨‍💻 Author

*Noel Gitari*  
*06/05/2025*

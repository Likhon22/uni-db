# University Database

A PostgreSQL database system for managing university resources including students, courses, and course enrollments.

## Database Schema

The database consists of three main tables:

1. **Students** - Stores information about students
2. **Courses** - Contains course details
3. **Enrollments** - Maps the many-to-many relationship between students and courses

### Tables Structure

#### Students
- `student_id` - Primary key, auto-incremented
- `student_name` - Student's full name
- `age` - Student's age
- `email` - Student's email address
- `frontend_mark` - Student's mark in frontend subjects
- `backend_mark` - Student's mark in backend subjects
- `status` - Student's status (e.g., "Awarded")

#### Courses
- `course_id` - Primary key, auto-incremented
- `course_name` - Name of the course
- `credits` - Number of credits for the course

#### Enrollments
- `enrollment_id` - Primary key, auto-incremented
- `student_id` - Foreign key referencing students
- `course_id` - Foreign key referencing courses

## Example Queries

The database includes several example queries:

1. **Insert a new student**:
   - Adds a new student named Likhon with equal frontend and backend marks

2. **Find students enrolled in a specific course**:
   - Retrieves names of students enrolled in the "Next.js" course

3. **Award top-performing student**:
   - Updates the status to "Awarded" for the student with the highest combined marks

4. **Clean up unused courses**:
   - Removes courses that don't have any student enrollments

5. **Pagination example**:
   - Retrieves 2 students, skipping the first one

6. **Count enrollments per course**:
   - Shows the number of students enrolled in each course

7. **Calculate average age**:
   - Computes the average age of all students

8. **Filter students by email domain**:
   - Finds all students with email addresses ending with "example.com"

## Setup Instructions

1. Make sure PostgreSQL is installed on your system
2. Run the `uni_db.sql` script to create the database and tables
3. The script will also populate the tables with sample data and execute example queries

## Sample Data

The database comes pre-populated with:
- 6 students with various frontend and backend marks
- 4 courses (Next.js, React.js, Databases, Prisma)
- 4 enrollment records

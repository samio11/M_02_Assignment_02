## Q1:- Explain the purpose of the WHERE clause in a SELECT statement
WHERE ক্লজ একটি SQL SELECT স্টেটমেন্টে ব্যবহার করা হয় নির্দিষ্ট শর্ত অনুযায়ী তথ্য ফিল্টার করার জন্য। অর্থাৎ, এই ক্লজটি ডেটাবেসকে বলে দেয় যে, শুধু সেই রো/সারি গুলো ফেরত দিতে যেগুলো নির্দিষ্ট শর্ত পূরণ করে। এটি ডেটা অনুসন্ধানে খুবই গুরুত্বপূর্ণ কারণ এটি আমাদের প্রয়োজন অনুযায়ী ফলাফল কমিয়ে আনে।
#### Overall Table to give examples
| ID | Name   | Age | City       | Marks |
| -- | ------ | --- | ---------- | ----- |
| 1  | Samio  | 22  | Dhaka      | 85    |
| 2  | Arafat | 23  | Sylhet     | 78    |
| 3  | Tanvir | 21  | Dhaka      | 90    |
| 4  | Rahim  | 24  | Chittagong | 60    |

### Query-01 (Students টেবিল থেকে এমন সকল সারি/রো দেখাও, যাদের শহরের নাম Dhaka)
#### SELECT * FROM Students WHERE City = 'Dhaka';

| ID | Name   | Age | City  | Marks |
| -- | ------ | --- | ----- | ----- |
| 1  | Samio  | 22  | Dhaka | 85    |
| 3  | Tanvir | 21  | Dhaka | 90    |

### Query-02 (Students টেবিল থেকে কেবল নাম এবং মার্কস দেখাও, যেখানে মার্কস ৮০-এর বেশি)
#### SELECT Name, Marks FROM Students WHERE Marks > 80;

| Name   | Marks |
| ------ | ----- |
| Samio  | 85    |
| Tanvir | 90    |

#### WHERE ক্লজ ডেটা খুঁজে পাওয়ার জন্য শর্ত নির্ধারণ করে। এতে শুধু প্রয়োজনীয় তথ্যই বের হয়, বাকি গুলো বাদ পড়ে।

## Q2:- What are the LIMIT and OFFSET clauses used for?

- **LIMIT**: এটি নির্ধারণ করে মোট কতটি রেকর্ড রিটার্ন করা হবে। উদাহরণস্বরূপ, LIMIT 2 মানে সর্বোচ্চ ২টি রো দেখাবে।
- **OFFSET**: এটি বলে দেয় কতটি রো স্কিপ করবে রেজাল্ট দেখানোর আগে। সাধারণত এটি পেজিনেশনের জন্য ব্যবহার করা হয়।

These clauses are commonly used together to implement pagination in database queries.
#### Main Table
| ID | Name   | Age | City       | Marks |
| -- | ------ | --- | ---------- | ----- |
| 1  | Samio  | 22  | Dhaka      | 85    |
| 2  | Arafat | 23  | Sylhet     | 78    |
| 3  | Tanvir | 21  | Dhaka      | 90    |
| 4  | Rahim  | 24  | Chittagong | 60    |
#### Pagination ধারণা:
#### OFFSET = (পেজ নম্বর - 1) * লিমিট
#### LIMIT = প্রতি পেজে কতটি রেকর্ড
### Query
#### SELECT * FROM Students OFFSET (1-1)*2 LIMIT 2;
#### Explain:-
##### OFFSET (1-1)*2 = 0 → কোন রো স্কিপ করবে না
##### LIMIT 2 → প্রথম ২টি রো দেখাবে
| ID | Name   | Age | City       | Marks |
| -- | ------ | --- | ---------- | ----- |
| 1  | Samio  | 22  | Dhaka      | 85    |
| 2  | Arafat | 23  | Sylhet     | 78    |

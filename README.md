## Q1:- Explain the purpose of the WHERE clause in a SELECT statement
The WHERE clause in a SELECT statement is used to filter data from a table. It tells the database to return only those rows that meet a specific condition.

#### Overall Table to give examples
| ID | Name   | Age | City       | Marks |
| -- | ------ | --- | ---------- | ----- |
| 1  | Samio  | 22  | Dhaka      | 85    |
| 2  | Arafat | 23  | Sylhet     | 78    |
| 3  | Tanvir | 21  | Dhaka      | 90    |
| 4  | Rahim  | 24  | Chittagong | 60    |

### Query-01
#### SELECT * FROM Students WHERE City = 'Dhaka';

| ID | Name   | Age | City  | Marks |
| -- | ------ | --- | ----- | ----- |
| 1  | Samio  | 22  | Dhaka | 85    |
| 3  | Tanvir | 21  | Dhaka | 90    |

### Query-02
#### SELECT Name, Marks FROM Students WHERE Marks > 80;

| Name   | Marks |
| ------ | ----- |
| Samio  | 85    |
| Tanvir | 90    |


## Q2:- What are the LIMIT and OFFSET clauses used for?

- **LIMIT**: The LIMIT clause is used in SQL to specify the maximum number of rows that the query should return.
- **OFFSET**: The OFFSET clause is used to skip a specific number of rows before starting to return rows from the query result.

These clauses are commonly used together to implement pagination in database queries.
#### Main Table
| ID | Name   | Age | City       | Marks |
| -- | ------ | --- | ---------- | ----- |
| 1  | Samio  | 22  | Dhaka      | 85    |
| 2  | Arafat | 23  | Sylhet     | 78    |
| 3  | Tanvir | 21  | Dhaka      | 90    |
| 4  | Rahim  | 24  | Chittagong | 60    |
##### Pagination main concept OFFSET (page-1)*limit LIMIT limit;
### Query
#### SELECT * FROM Students OFFSET (2-1)*2 LIMIT 2;
| ID | Name   | Age | City       | Marks |
| -- | ------ | --- | ---------- | ----- |
| 1  | Samio  | 22  | Dhaka      | 85    |
| 2  | Arafat | 23  | Sylhet     | 78    |

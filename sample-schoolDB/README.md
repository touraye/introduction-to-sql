# Sample Student Database

### Entity(s)

1. Students

### Data Types Used

| Column     | Types        |
| ---------- | ------------ |
| first_name | VARCHAR(25)  |
| last_name  | VARCHAR(25)  |
| login      | REAL         |
| age        | INT          |
| gpa        | INT          |
| house      | VARCHAR(100) |



#### Preview 

| first_name | last_name | login      | age  | gpa  | house      |
| ---------- | --------- | ---------- | ---- | ---- | ---------- |
| Ebrima     | 2ray      | 2ray202    | 15   | 4.0  | Gamhome12  |
| Lamin      | Gibba     | lifeisgood | 15   | 3.8  | Gamhouse12 |
| Jankey     | Faal      | fajan30    | 18   | 2.7  | Gamhouse12 |
| Bob        | Sow       | sow999     | 23   | 4.0  | fatplated4 |
| Sula       | Dicko     | dicko100   | 14   | 4.0  | Hirmfirm3  |



Consider some useful queries:

1. Select the first, and last name from students

```sql
SELECT first_name, last_name FROM students;
```

2. Read from the entire db

   ```sql
   SELECT * FROM student;
   ```

3. Select students base their house

   ```sql
   SELECT * FROM students WHERE house = 'Gamhome12';
   ```

4. Select students base their house and gpa

   ```sql
   SElECT * FROM students WHERE house = 'Gamhome12' AND gpa > 3.8;
   ```

5. Select student using the LIKE 

   ```sql
   SELECT first_name, last_name FROM students WHERE first_name LIKE 'E%';
   ```

6. Select student using ORDER BY

   ```sql
   SELECT * FROM students ORDER BY house;
   ```

7. Select students using COUNT

   ```sql
   SELECT COUNT(first_name) FROM students;
   ```

8. Select students using COUNT and GROUP BY

   ```sql
   SELECT COUNT(first_name), house FROM students GROUP BY house;
   ```

   
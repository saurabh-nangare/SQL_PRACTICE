Input tables -->

employees -->

id | name                | position_id
---+---------------------+-------------
1  | John Smith          | 1
2  | Jane Doe            | 2
3  | Michael Brown       | 2
4  | Emily Johnson       | 2
5  | William Lee         | 3
6  | Jessica Clark       | 3
7  | Christopher Harris  | 3
8  | Olivia Wilson       | 3
9  | Daniel Martinez     | 3
10 | Sophia Miller       | 3


Positions -->

id | title            | groups | levels | payscale | totalpost
---+------------------+--------+--------+----------+-----------
1  | General manager  | A      | l-15   | 10000    | 1
2  | Manager          | B      | l-14   | 9000     | 5
3  | Asst. Manager    | C      | l-13   | 8000     | 10



output -->>

title            | groups | levels | payscale | name
------------------+--------+--------+----------+---------------------
General manager  | A      | l-15   | 10000    | John Smith
Manager          | B      | l-14   | 9000     | Jane Doe
Manager          | B      | l-14   | 9000     | Michael Brown
Manager          | B      | l-14   | 9000     | Emily Johnson
Manager          | B      | l-14   | 9000     | Vacant
Manager          | B      | l-14   | 9000     | Vacant
Asst. Manager    | C      | l-13   | 8000     | Vacant
Asst. Manager    | C      | l-13   | 8000     | William Lee
Asst. Manager    | C      | l-13   | 8000     | Jessica Clark
Asst. Manager    | C      | l-13   | 8000     | Christopher Harris
Asst. Manager    | C      | l-13   | 8000     | Olivia Wilson
Asst. Manager    | C      | l-13   | 8000     | Daniel Martinez
Asst. Manager    | C      | l-13   | 8000     | Sophia Miller
Asst. Manager    | C      | l-13   | 8000     | Vacant
Asst. Manager    | C      | l-13   | 8000     | Vacant
Asst. Manager    | C      | l-13   | 8000     | Vacant

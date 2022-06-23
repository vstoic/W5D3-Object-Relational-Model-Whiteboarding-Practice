# Partner A: White Boarding

Ask your partner the below questions! **Don't spend longer than 20 minutes per
coding question.** Start a timer once the question has finished being read (or
the relevant information has been presented).

## Question One: Employees Query

You are given a PostgreSQL database with two tables: the first is an `employees`
table and the second is a `departments` table. Employees can belong to a single
department.

1.  Write a SQL query that, given a department name, finds all the employees
    `name`s that are in that department.

2.  Next find the name of the employees that don't belong to any department

#### Solution

```sql

--  1.
SELECT
  employees.name
FROM
  employees
JOIN
  departments ON employees.department_id = departments.id
WHERE
  departments.name = ?


--  2.
SELECT
  employees.name
FROM
  employees
WHERE
  employees.department_id IS NULL;

```

## Question Two: Reverse Words

Write a function takes an array of characters and reverses the order of the words in place.

Example: ["c", "a", "k", "e", " ", "p", "o", "u", "n", "d", " ", "s", "t", "e", "a", "l"] => ["s", "t", "e", "a", "l", " ", "p", "o", "u", "n", "d", " ", "c", "a", "k", "e"]

Complexities:

Time - linear
Space - constant

Hint #1: how could you transform the input to make the problem easier so you don’t run into the edge case of the first and last word being different lengths?
Hint #2: reversing a single word between two spaces is easy and doesn’t encounter that edge case. How can you use that idea and hint #1 to get the answer?

Takeaways:
  * Use pointers
  * Consider how the input could be transformed to make the problem easier (other applications of this idea is sorting the input)
  * Inserting an element into the middle of an array is linear time complexity because of moving all all of the array elements over. Inserting anywhere but the end of the array is linear time. Arrays are stored in consecutive blocks in memory which is why lookup is constant given an index.

## Question Three:

Paraphrase the advantages of using an ORM (Object Relational Model).

**Answer**: Using an ORM (Object Relational Model) allows you to interact with
database information in an OOP way. An ORM will translate rows
from your SQL tables into Ruby objects on fetch, and translates your Ruby
objects back to rows on save resulting in less overall database access code.
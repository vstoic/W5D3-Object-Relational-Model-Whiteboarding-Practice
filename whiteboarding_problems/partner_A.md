# Partner B: White Boarding

Ask your partner the below questions! **Don't spend longer than 20 minutes per
coding question.** Start a timer once the question has finished being read (or
the relevant information has been presented).

## Question One

Given the following table:

```ruby
# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

```

Write the following SQL Query:

1.  In which years was the Physics prize awarded, but no Chemistry prize?

#### Solution

```sql
SELECT DISTINCT
    yr
FROM
    nobels
WHERE
    (subject = 'Physics' AND yr NOT IN (
    SELECT
        yr
    FROM
        nobels
    WHERE
        subject = 'Chemistry'
    ))


```

## Question Two: Reverse Characters

Write a function that takes an array of characters and reverses the characters in place.

Example: ['h', 'e', 'l', 'l', 'o'] => ['o', 'l', 'l', 'e', 'h']

Complexities:

Time - linear
Space - constant

Takeaways:
  * Use pointers
  * In place is different than returning a value. Think of functions having a return value or performing a side effect. Single responsiblity principle.
  * How would you use this function in real code?

## Question Three

Given all possible SQL commands order by order of query execution. (SELECT,
DISTINCT, FROM, JOIN, WHERE, GROUP BY, HAVING, LIMIT/OFFSET, ORDER).

**Answer**:

1. FROM and JOINs
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. DISTINCT
7. ORDER BY
8. LIMIT / OFFSET


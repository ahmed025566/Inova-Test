SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report NULL:

SELECT
    (SELECT DISTINCT salary
     FROM Employee
     ORDER BY salary DESC
     LIMIT 1 OFFSET 1) AS second_highest_salary;
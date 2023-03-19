-- Напишите запрос, с помощью которого можно найти дубли в поле email из таблицы Sfaff.

SELECT email, COUNT(*) AS count
FROM Staff
GROUP BY email
HAVING COUNT(*) > 1;

-- Напишите запрос, с помощью которого можно определить возраст каждого сотрудника из таблицы Staff на момент запроса.
SELECT staff_id, name, EXTRACT(YEAR FROM age(CURRENT_DATE, birthday)) AS Age
FROM Staff;
  
-- Напишите запрос, с помощью которого можно определить должность (Jobtitles.name) со вторым по величине уровнем зарплаты.
SELECT jobtitle 
FROM Staff
JOIN Jobtitles ON Staff.jobtitle_id = Jobtitles.jobtitle_id 
WHERE salary = (
SELECT MAX(salary) 
FROM Staff 
WHERE salary < (SELECT MAX(salary) FROM Staff));

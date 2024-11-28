--QUERY 1:

--Query names in alphabetical order with the first letter of their profession in parentheses.

-- 𝐂𝐫𝐞𝐚𝐭𝐞 𝐭𝐡𝐞 𝐎𝐂𝐂𝐔𝐏𝐀𝐓𝐈𝐎𝐍𝐒 𝐭𝐚𝐛𝐥𝐞 
CREATE TABLE OCCUPATIONS ( name VARCHAR(50), occupation VARCHAR(50) ); 
-- 𝐈𝐧𝐬𝐞𝐫𝐭 𝐬𝐚𝐦𝐩𝐥𝐞 𝐝𝐚𝐭𝐚 𝐢𝐧𝐭𝐨 𝐭𝐡𝐞 𝐎𝐂𝐂𝐔𝐏𝐀𝐓𝐈𝐎𝐍𝐒 𝐭𝐚𝐛𝐥𝐞 
INSERT INTO OCCUPATIONS (name, occupation) VALUES ('Alice', 'Doctor'), ('Bob', 'Actor'), ('Charlie', 'Singer'), ('David', 'Actor'), ('Eve', 'Professor'), ('Frank', 'Singer'), ('Grace', 'Doctor');

SELECT * FROM OCCUPATIONS;

SELECT CONCAT(NAME,'(',SUBSTRING(OCCUPATION,1,1),')') AS NAMES
FROM OCCUPATIONS
ORDER BY NAME;

--QUERY 2:

--Count the number of individuals in each profession and format the output as:
--There are a total of [count] [profession]s.

SELECT CONCAT('There are a total of ' ,COUNT(NAME),' ',LOWER(OCCUPATION),CASE WHEN COUNT(NAME)>1 THEN 's.' ELSE '.' END) AS SENTENCE
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(NAME),OCCUPATION ASC

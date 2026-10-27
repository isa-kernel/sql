-- ===================================================== -- CampusConnect: SQL Fundamentals Practice -- Database: campusconnect -- =====================================================

-- 1. LIST ALL
-- \dt

-- 2. INSPECT A
\dt categories ;

\d categories

-- 3. SELECT: VIEW ALL CATEGORIES
SELECT * FROM categories;

-- 4. INSERT: ADD A CATEGORY
INSERT INTO
    categories (category_id, category_name)
VALUES (7, 'services');

-- Note: This inserts a row. Run it only once unless -- you intentionally want to insert another category.

-- 5. SELECT: VIEW ALL USERS
SELECT * FROM users;

-- 6. SELECT: VIEW ONLY THE ROLE
SELECT role FROM users;

-- 7. WHERE: FILTER USERS BY
SELECT * FROM users WHERE role = 'buyer';

-- 8. LIMIT: RETURN ONLY FIVE ROWS
SELECT * FROM users LIMIT 5;

-- 9. ORDER BY: SORT BY USER ID, DESCENDING
SELECT * FROM users ORDER BY user_id DESC;

-- 10. OFFSET: SKIP THE FIRST TEN ROWS SELECT * FROM users ORDER BY user_id ASC OFFSET 10;

-- 11. UPDATE: CHANGE A USER'S EMAIL UPDATE users SET email = 'kim@example.com' WHERE user_id = 6;

-- Check the updated row
SELECT * FROM users WHERE user_id = 6;

-- 12. DISTINCT: FIND UNIQUE CAMPUSES
SELECT DISTINCT campus FROM users;

-- 13. DISTINCT: FIND UNIQUE JOINING DATES
SELECT DISTINCT joined_at FROM users;

-- 14. DISTINCT: FIND UNIQUE CAMPUS AND NAME COMBINATIONS
SELECT DISTINCT campus, full_name FROM users;

-- 15. DISTINCT: FIND UNIQUE ROLES
SELECT DISTINCT role FROM users;

-- 16. ORDER BY: SORT USERS BY ROLE
SELECT * FROM users ORDER BY role;

-- 17. ORDER BY: SORT USERS BY JOINING DATE
SELECT * FROM users ORDER BY joined_at ASC;

-- 18. DISTINCT + ORDER BY: UNIQUE CAMPUSES ALPHABETICALLY
SELECT DISTINCT campus FROM users ORDER BY campus ASC;

-- 19. WHERE + ORDER BY: BUYERS, NEWEST FIRST
SELECT * FROM users WHERE role = 'buyer' ORDER BY joined_at DESC;

-- 20. LIMIT + OFFSET: PAGINATION
SELECT * FROM users ORDER BY user_id ASC LIMIT 5 OFFSET 5;

-- 21. GROUP BY + COUNT: COUNT USERS PER ROLE
SELECT role, COUNT(*) AS total_users
FROM users
GROUP BY
    role
ORDER BY total_users DESC;
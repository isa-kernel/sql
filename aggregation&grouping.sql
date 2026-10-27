-- 1. Count all users
SELECT COUNT(*) AS total_users FROM users;

-- 2. Count users who have emails
SELECT COUNT(email) AS users_with_email FROM users;

-- 3. Count users in each role
SELECT role, COUNT(*) AS total_users FROM users GROUP BY role;

-- 4. Find the earliest account registration
SELECT MIN(created_at) AS earliest_registration FROM users;

-- 5. Find the latest account registration
SELECT MAX(created_at) AS latest_registration FROM users;

-- 6. Calculate the average user ID (practice example)
SELECT AVG(user_id) AS average_user_id FROM users;

SELECT SUM(amount) AS total_payments FROM payments;

-- 1. Group users by role
SELECT role, COUNT(*) AS total_users FROM users GROUP BY role;

-- 2. Group users by registration date
SELECT
    created_at::date AS registration_date,
    COUNT(*) AS total_users
FROM users
GROUP BY
    created_at::date
ORDER BY registration_date;

-- 3. Group users by email availability
SELECT
    CASE
        WHEN email IS NULL THEN 'No Email'
        ELSE 'Has Email'
    END AS email_status,
    COUNT(*) AS total_users
FROM users
GROUP BY
    email_status;

-- 1. Roles with more than 2 users
SELECT role, COUNT(*) AS total_users
FROM users
GROUP BY
    role
HAVING
    COUNT(*) > 2;

-- 2. Roles with at least 5 users
SELECT role, COUNT(*) AS total_users
FROM users
GROUP BY
    role
HAVING
    COUNT(*) >= 5;

-- 3. Roles with more than 2 users who have emails
SELECT role, COUNT(email) AS email_count
FROM users
GROUP BY
    role
HAVING
    COUNT(email) > 2;

-- 4. Combine WHERE and HAVING
SELECT role, COUNT(*) AS total_users
FROM users
WHERE
    email IS NOT NULL
GROUP BY
    role
HAVING
    COUNT(*) >= 2;

-- 1. Display unique roles
SELECT DISTINCT role FROM users;

-- 2. Display unique email addresses
SELECT DISTINCT email FROM users;

-- 3. Count the different roles
SELECT COUNT(DISTINCT role) AS number_of_roles FROM users;

-- 4. Display unique role and registration-date combinations
SELECT DISTINCT
    role,
    created_at::date AS registration_date
FROM users;

-- 1. Categorize users by role
SELECT
    user_id,
    email,
    role,
    CASE
        WHEN role = 'admin' THEN 'Administrator'
        WHEN role = 'student' THEN 'Student'
        WHEN role = 'lecturer' THEN 'Lecturer'
        ELSE 'Other Role'
    END AS role_description
FROM users;

-- 2. Categorize users by email availability
SELECT
    user_id,
    email,
    CASE
        WHEN email IS NULL THEN 'Missing Email'
        WHEN email = '' THEN 'Empty Email'
        ELSE 'Email Provided'
    END AS email_status
FROM users;

-- 3. Categorize accounts by age
SELECT
    user_id,
    created_at,
    CASE
        WHEN created_at IS NULL THEN 'Unknown'
        WHEN created_at >= CURRENT_TIMESTAMP - INTERVAL '30 days' THEN 'Recent Account'
        ELSE 'Older Account'
    END AS account_category
FROM users;

-- 1. Rename columns
SELECT
    user_id AS campus_id,
    email AS user_email,
    role AS account_role
FROM users;

-- 2. Rename aggregate results
SELECT role AS user_role, COUNT(*) AS total_members
FROM users
GROUP BY
    role;

-- 3. Use a table alias
SELECT u.user_id, u.email, u.role FROM users AS u;

-- 4. Give a calculated column an alias
SELECT user_id, LENGTH(email) AS email_length FROM users;

-- 1. Get today's date
SELECT CURRENT_DATE AS today;

-- 2. Get the current date and time
SELECT CURRENT_TIMESTAMP AS current_date_time;

-- 3. Extract the registration year
SELECT user_id, EXTRACT(
        YEAR
        FROM created_at
    ) AS registration_year
FROM users;

-- 4. Extract the registration month
SELECT user_id, EXTRACT(
        MONTH
        FROM created_at
    ) AS registration_month
FROM users;

-- 5. Find users registered in the last 30 days
SELECT *
FROM users
WHERE
    created_at >= CURRENT_TIMESTAMP - INTERVAL '30 days';

-- 6. Calculate account age
SELECT
    user_id,
    created_at,
    AGE (CURRENT_TIMESTAMP, created_at) AS account_age
FROM users;

-- 7. Count registrations by year
SELECT
    EXTRACT(
        YEAR
        FROM created_at
    ) AS registration_year,
    COUNT(*) AS total_users
FROM users
WHERE
    created_at IS NOT NULL
GROUP BY
    EXTRACT(
        YEAR
        FROM created_at
    )
ORDER BY registration_year;

-- 1. Convert emails to uppercase
SELECT UPPER(email) AS uppercase_email FROM users;

-- 2. Convert emails to lowercase
SELECT LOWER(email) AS lowercase_email FROM users;

-- 3. Count characters in emails
SELECT email, LENGTH(email) AS email_length FROM users;

-- 4. Remove leading and trailing spaces
SELECT TRIM(email) AS cleaned_email FROM users;

-- 5. Extract the first 5 characters
SELECT SUBSTRING( email FROM 1 FOR 5 ) AS email_prefix FROM users;

-- 6. Extract the first 4 characters
SELECT LEFT(email, 4) AS email_start FROM users;

-- 7. Extract the last 4 characters
SELECT RIGHT(email, 4) AS email_end FROM users;

-- 8. Find the position of @ in an email
SELECT email, POSITION('@' IN email) AS at_position FROM users;

-- 9. Replace text in an email (display only)
SELECT REPLACE(
        email, 'gmail.com', 'example.com'
    ) AS modified_email
FROM users;

-- 10. Join text values
SELECT CONCAT(
        'User ID: ', user_id, ' | Role: ', role
    ) AS user_summary
FROM users;

-- 1. Count users per role and show roles with more than 3 users
SELECT UPPER(role) AS user_role, COUNT(*) AS total_users
FROM users
GROUP BY
    role
HAVING
    COUNT(*) > 3
ORDER BY total_users DESC;

-- 2. Count users with emails per role
SELECT role, COUNT(email) AS users_with_email
FROM users
WHERE
    email IS NOT NULL
GROUP BY
    role
HAVING
    COUNT(email) >= 2;

-- 3. Count users registered in the last 30 days by role
SELECT role, COUNT(*) AS recent_users
FROM users
WHERE
    created_at >= CURRENT_TIMESTAMP - INTERVAL '30 days'
GROUP BY
    role
ORDER BY recent_users DESC;

-- 4. Show unique roles in uppercase
SELECT DISTINCT
    UPPER(role) AS user_role
FROM users
WHERE
    role IS NOT NULL;

-- 5. Show roles with missing or available email addresses
SELECT
    role,
    COUNT(*) AS total_users,
    COUNT(email) AS users_with_email,
    COUNT(*) - COUNT(email) AS users_without_email
FROM users
GROUP BY
    role;
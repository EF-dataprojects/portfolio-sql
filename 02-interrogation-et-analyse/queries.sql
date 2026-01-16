-- Afficher tous les utilisateurs
SELECT * FROM users;

-- Afficher les livres avec le nom de l'auteur
SELECT b.title, a.name AS author
FROM books b
JOIN authors a ON b.author_id = a.id;

-- Afficher les utilisateurs qui ont un email
SELECT * FROM users
WHERE email IS NOT NULL
ORDER BY name;

-- Compter les utilisateurs avec email
SELECT COUNT(*) AS total_users_with_email
FROM users
WHERE email IS NOT NULL;

-- Afficher les prêts avec les noms des utilisateurs et livres
SELECT u.name AS user, b.title AS book, l.loan_date
FROM loans l
JOIN users u ON l.user_id = u.id
JOIN books b ON l.book_id = b.id;

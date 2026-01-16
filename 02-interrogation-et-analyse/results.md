# Résultats des requêtes

## 1. Tous les utilisateurs
| id | name    | created_at          | email             |
|----|---------|--------------------|-----------------|
| 1  | Alicia  | 2025-12-18 09:47:46| alice@example.com |
| 2  | Bob     | 2025-12-18 09:47:46| bob@example.com   |
| 3  | Charlie | 2025-12-18 09:47:46| NULL              |
| 4  | Alicia  | 2025-12-18 10:01:24| NULL              |
| 5  | Bob     | 2025-12-18 10:01:24| NULL              |
| 6  | Charlie | 2025-12-18 10:01:24| NULL              |

## 2. Livres et auteurs
| title                               | author        |
|-------------------------------------|---------------|
| 1984                                | George Orwell |
| Harry Potter à l'école des sorciers | J.K. Rowling  |
| Le Seigneur des Anneaux             | J.R.R. Tolkien|
| 1984                                | George Orwell |
| Harry Potter à l'école des sorciers | J.K. Rowling  |
| Le Seigneur des Anneaux             | J.R.R. Tolkien|

## 3. Utilisateurs avec email
| id | name   | created_at          | email             |
|----|--------|--------------------|-----------------|
| 1  | Alicia | 2025-12-18 09:47:46| alice@example.com |
| 4  | Alicia | 2025-12-18 10:01:24| alice@example.com |
| 2  | Bob    | 2025-12-18 09:47:46| bob@example.com   |
| 5  | Bob    | 2025-12-18 10:01:24| bob@example.com   |

## 4. Total utilisateurs avec email
| total_users_with_email |
|-----------------------|
| 4                     |

## 5. Prêts avec utilisateurs et livres
| user   | book                                  | loan_date  |
|--------|---------------------------------------|------------|
| Alicia | 1984                                  | 2025-12-18 |
| Alicia | Harry Potter à l'école des sorciers   | 2025-12-18 |
| Bob    | Harry Potter à l'école des sorciers   | 2025-12-18 |

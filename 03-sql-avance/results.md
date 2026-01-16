# Résultats SQL Avancé

## 1. Vue user_loans
| user_id | user_name | book_title | loan_date  |
|---------|-----------|------------|------------|
| 1       | Alicia    | 1984       | 2025-12-18 |
| 1       | Alicia    | Harry Potter à l'école des sorciers | 2025-12-18 |
| 2       | Bob       | Harry Potter à l'école des sorciers | 2025-12-18 |
| 3       | Charlie   | NULL       | NULL       |
| 4       | Alicia    | NULL       | NULL       |
| 5       | Bob       | NULL       | NULL       |
| 6       | Charlie   | NULL       | NULL       |

## 2. Vue user_loan_count
| user_id | user_name | total_loans |
|---------|-----------|-------------|
| 1       | Alicia    | 2           |
| 2       | Bob       | 1           |
| 6       | Charlie   | 0           |
| 5       | Bob       | 0           |
| 4       | Alicia    | 0           |
| 3       | Charlie   | 0           |

## 3. RANK et total avancé
| user_id | user_name | total_loans | loan_rank |
|---------|-----------|-------------|-----------|
| 1       | Alicia    | 2           | 1         |
| 2       | Bob       | 1           | 2         |
| 6       | Charlie   | 0           | 3         |
| 5       | Bob       | 0           | 3         |
| 4       | Alicia    | 0           | 3         |
| 3       | Charlie   | 0           | 3         |

## 4. Logs et triggers
| id | action_type | user_id | book_id | action_date         |
|----|-------------|---------|---------|--------------------|
| 1  | INSERT      | 3       | 3       | 2025-12-18 16:48:06|


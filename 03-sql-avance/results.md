# Résultats Section 3 : SQL Avancé

## 1. user_loans
| user_id | user_name | book_title                          | loan_date  |
|---------|-----------|------------------------------------|------------|
| 1       | Alicia    | 1984                               | 2025-12-18 |
| 1       | Alicia    | Harry Potter à l'école des sorciers| 2025-12-18 |
| 2       | Bob       | Harry Potter à l'école des sorciers| 2025-12-18 |
| 3       | Charlie   | NULL                               | NULL       |
| 4       | Alicia    | NULL                               | NULL       |
| 5       | Bob       | NULL                               | NULL       |
| 6       | Charlie   | NULL                               | NULL       |

## 2. user_loan_count
| user_id | user_name | total_loans |
|---------|-----------|-------------|
| 1       | Alicia    | 2           |
| 2       | Bob       | 1           |
| 3       | Charlie   | 0           |
| 4       | Alicia    | 0           |
| 5       | Bob       | 0           |
| 6       | Charlie   | 0           |

## 3. loans après safe_add_loan et upsert_loan
| user_id | book_id | loan_date  |
|---------|---------|------------|
| 1       | 1       | 2025-12-18 |
| 1       | 2       | 2025-12-18 |
| 2       | 2       | 2025-12-18 |
| 3       | 1       | 2025-12-18 |
| 3       | 2       | 2025-12-18 |

## 4. user_loan_advanced
| user_id | user_name | total_loans | loan_rank | percent_rank | cumulative_loans |
|---------|-----------|-------------|-----------|--------------|-----------------|
| 1       | Alicia    | 2           | 1         | 0.0          | 2               |
| 2       | Bob       | 1           | 2         | 0.1667       | 3               |
| 3       | Charlie   | 0           | 3         | 0.3333       | 3               |
| 4       | Alicia    | 0           | 3         | 0.3333       | 3               |
| 5       | Bob       | 0           | 3         | 0.3333       | 3               |
| 6       | Charlie   | 0           | 3         | 0.3333       | 3               |
| 7       | Diana     | 0           | 3         | 0.3333       | 3               |


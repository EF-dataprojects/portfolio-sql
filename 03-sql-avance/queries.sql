-- Section 3 : SQL Avancé pour Portfolio

-- Création table loans si elle n'existe pas
DROP TABLE IF EXISTS loans;
CREATE TABLE loans (
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    loan_date DATE DEFAULT CURDATE(),
    PRIMARY KEY (user_id, book_id),
    CONSTRAINT fk_loans_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_loans_book
        FOREIGN KEY (book_id) REFERENCES books(id)
        ON DELETE CASCADE
);

-- Screen 1 : Vue des prêts
CREATE OR REPLACE VIEW user_loans AS
SELECT u.id AS user_id, u.name AS user_name, b.title AS book_title, l.loan_date
FROM users u
LEFT JOIN loans l ON u.id = l.user_id
LEFT JOIN books b ON l.book_id = b.id;

-- Screen 2 : Total prêts par utilisateur
CREATE OR REPLACE VIEW user_loan_count AS
SELECT u.id AS user_id, u.name AS user_name, COUNT(l.book_id) AS total_loans
FROM users u
LEFT JOIN loans l ON u.id = l.user_id
GROUP BY u.id, u.name
ORDER BY total_loans DESC;

-- Screen 3 : Procédure pour ajouter un prêt
DELIMITER //
CREATE PROCEDURE add_loan(IN p_user_id INT, IN p_book_id INT)
BEGIN
    INSERT INTO loans(user_id, book_id, loan_date)
    VALUES (p_user_id, p_book_id, CURDATE());
END //
DELIMITER ;

-- Screen 4 : Vue classement des prêts
CREATE OR REPLACE VIEW user_loan_rank AS
SELECT u.id AS user_id, u.name AS user_name,
       COUNT(l.book_id) AS total_loans,
       RANK() OVER (ORDER BY COUNT(l.book_id) DESC) AS loan_rank
FROM users u
LEFT JOIN loans l ON u.id = l.user_id
GROUP BY u.id, u.name
ORDER BY loan_rank;

-- Screen 5 : Procédure pour supprimer un prêt
DELIMITER //
CREATE PROCEDURE remove_loan(IN p_user_id INT, IN p_book_id INT)
BEGIN
    DELETE FROM loans WHERE user_id = p_user_id AND book_id = p_book_id;
END //
DELIMITER ;

-- Screen 6 : Fonction total prêts par utilisateur
DELIMITER //
CREATE FUNCTION get_total_loans(p_user_id INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM loans WHERE user_id = p_user_id;
    RETURN total;
END //
DELIMITER ;

-- Screen 7 : Procédure sécurisée pour ajouter un prêt
DELIMITER //
CREATE PROCEDURE safe_add_loan(IN p_user_id INT, IN p_book_id INT)
BEGIN
    IF EXISTS (SELECT 1 FROM loans WHERE user_id = p_user_id AND book_id = p_book_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ce livre est déjà emprunté par cet utilisateur';
    ELSE
        INSERT INTO loans(user_id, book_id, loan_date) VALUES (p_user_id, p_book_id, CURDATE());
    END IF;
END //
DELIMITER ;

-- Screen 8 : Procédure UPSERT pour utilisateurs
DELIMITER //
CREATE PROCEDURE upsert_user(IN p_name VARCHAR(50), IN p_email VARCHAR(100))
BEGIN
    IF EXISTS (SELECT 1 FROM users WHERE name = p_name) THEN
        UPDATE users SET email = p_email WHERE name = p_name;
    ELSE
        INSERT INTO users(name, email) VALUES (p_name, p_email);
    END IF;
END //
DELIMITER ;

-- Screen 9 : Table et triggers pour log des prêts
CREATE TABLE IF NOT EXISTS loan_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(20),
    user_id INT,
    book_id INT,
    action_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_loan_insert AFTER INSERT ON loans
FOR EACH ROW
BEGIN
    INSERT INTO loan_logs(action_type, user_id, book_id)
    VALUES ('INSERT', NEW.user_id, NEW.book_id);
END //

CREATE TRIGGER after_loan_delete AFTER DELETE ON loans
FOR EACH ROW
BEGIN
    INSERT INTO loan_logs(action_type, user_id, book_id)
    VALUES ('DELETE', OLD.user_id, OLD.book_id);
END //
DELIMITER ;

-- Screen 12 : Vue avancée avec rank et percent_rank
CREATE OR REPLACE VIEW user_loan_advanced AS
SELECT u.id AS user_id, u.name AS user_name,
       COUNT(l.book_id) AS total_loans,
       RANK() OVER (ORDER BY COUNT(l.book_id) DESC) AS loan_rank,
       PERCENT_RANK() OVER (ORDER BY COUNT(l.book_id) DESC) AS percent_rank
FROM users u
LEFT JOIN loans l ON u.id = l.user_id
GROUP BY u.id, u.name
ORDER BY loan_rank;

-- Screen 13 : Procédure UPSERT pour prêts + trigger UPDATE
DELIMITER //
CREATE PROCEDURE upsert_loan(IN p_user_id INT, IN p_book_id INT)
BEGIN
    INSERT INTO loans(user_id, book_id, loan_date)
    VALUES (p_user_id, p_book_id, CURDATE())
    ON DUPLICATE KEY UPDATE loan_date = CURDATE();
END //

CREATE TRIGGER after_loan_update AFTER UPDATE ON loans
FOR EACH ROW
BEGIN
    INSERT INTO loan_logs(action_type, user_id, book_id)
    VALUES ('UPDATE', NEW.user_id, NEW.book_id);
END //
DELIMITER ;


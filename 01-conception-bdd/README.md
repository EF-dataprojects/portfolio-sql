# Conception et création de bases de données relationnelles

## Objectif
Ce projet a pour objectif de démontrer ma capacité à concevoir et créer une base de données relationnelle en SQL, en respectant les bonnes pratiques de modélisation et d’intégrité des données.

La base de données modélise un système simple de gestion de bibliothèque.

---

## Structure de la base de données

La base est composée de 4 tables :

### Users
- Stocke les utilisateurs de la bibliothèque
- Champs principaux :
  - id (clé primaire)
  - name
  - email
  - created_at

### Authors
- Stocke les auteurs des livres
- Champs :
  - id (clé primaire)
  - name

### Books
- Stocke les livres disponibles
- Relation avec la table authors
- Champs :
  - id (clé primaire)
  - title
  - published_year
  - genre
  - author_id (clé étrangère)

### Loans
- Gère les emprunts de livres
- Table de liaison entre users et books
- Clé primaire composée :
  - user_id
  - book_id

---

## Concepts SQL démontrés
- CREATE DATABASE / CREATE TABLE
- Clés primaires
- Clés étrangères
- Contraintes d’intégrité
- Types de données SQL

---

## Fichier principal
- `schema.sql` : contient la création complète de la base de données et des tables


# DigiTrip 🌍✈️

**DigiTrip** is a relational database system designed to support a virtual travel cataloging and sharing application. It was developed as the practical assignment for Bases de Dados @ University of Minho

---

## 📖 About the Project

DigiTrip was conceived for a fictional case study: Diogo Soares, founder of the travel blog *"Mundo Sem Fronteiras"*, wants to build an application that lets users catalog their trips, explore visited places virtually, and interact with other travelers. This repository contains the full analysis, conceptual and logical modeling, and physical implementation of the database that supports this application.

The project covers the entire database development lifecycle:

- System definition and requirements gathering (description, manipulation, and control requirements)
- Conceptual modeling (Entity-Relationship diagram)
- Logical modeling and normalization (up to 3NF)
- Query validation using Relational Algebra
- Physical implementation in **MySQL**, including:
  - Table creation with integrity constraints
  - Database users and roles with access control
  - Data population
  - Views, indexes, stored procedures, functions, and triggers

---

## 🗂️ Domain Overview

The system models the following core entities:

| Entity | Description |
|---|---|
| **Viajante** (Traveler) | The application's users, who register, create trips, and comment. |
| **Viagem** (Trip) | A journey created by a traveler, with dates, description, and purpose. |
| **Pais** (Country) | Geographical context for locations, with name, continent, and languages. |
| **Localidade** (Location) | Points of interest visited during a trip. |
| **Comentario** (Comment) | Feedback and ratings left by travelers on trips. |
| **Conteudo** (Content) | Multimedia (photos/videos) associated with locations and trips. |

Key relationships include a traveler *realizing* trips, a trip *visiting* locations (many-to-many), locations being *associated* with a country, and comments/content linked to both trips and locations.

---

## 🛠️ Tech Stack

- **MySQL** — relational database management system (DDL, DML, DCL)
- **MySQL Workbench** — logical model design
- **TerraER** — Entity-Relationship diagram modeling (Chen notation)
- **Relax** — relational algebra validation tool

---

## 📁 Repository Structure

The full technical report (in Portuguese) documents every phase of the project, including:

- System definition, feasibility analysis, and project planning (Gantt chart)
- Requirements gathering methodology and organized requirement lists
- Conceptual model (ER diagram) and entity/relationship characterization
- Logical model, data dictionary, and normalization proof (1NF, 2NF, 3NF)
- Relational algebra expressions validating user queries
- Full SQL implementation:
  - `CREATE TABLE` statements with constraints (`CHECK`, `FOREIGN KEY`, `UNIQUE`, etc.)
  - Database users and role-based access control (`CREATE ROLE`, `GRANT`)
  - Data population scripts (`INSERT INTO`)
  - Database size estimation and growth projection
  - Example views for public data exposure
  - SQL translations of user queries
  - Indexes for performance optimization
  - Stored functions (e.g., age calculation), triggers (e.g., automatic score update), and procedures (e.g., cascading user deletion)
  
---

## 👥 Team

- Afonso E. Santo
- José Costa
- Miguel Correia ([@miguelprcorreia](https://github.com/miguelprcorreia))
- Tomé Moreira

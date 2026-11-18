-- =====================================
-- PROJET : CENTRE-SANTÉ-GEST
-- Création des tables
-- =====================================

PRAGMA foreign_keys = ON;

-- TABLE PATIENT
CREATE TABLE IF NOT EXISTS Patient (
    id_patient INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    date_naissance TEXT,
    sexe TEXT,
    telephone TEXT,
    adresse TEXT
);

-- TABLE MEDECIN
CREATE TABLE IF NOT EXISTS Medecin (
    id_medecin INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    specialite TEXT,
    telephone TEXT
);

-- TABLE CONSULTATION
CREATE TABLE IF NOT EXISTS Consultation (
    id_consultation INTEGER PRIMARY KEY AUTOINCREMENT,
    date_consultation TEXT NOT NULL,
    motif TEXT,
    diagnostic TEXT,
    id_patient INTEGER NOT NULL,
    id_medecin INTEGER NOT NULL,
    FOREIGN KEY (id_patient) REFERENCES Patient(id_patient),
    FOREIGN KEY (id_medecin) REFERENCES Medecin(id_medecin)
);
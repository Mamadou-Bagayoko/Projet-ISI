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
-- TABLE RENDEZVOUS
CREATE TABLE IF NOT EXISTS RendezVous (
    id_rendezvous INTEGER PRIMARY KEY AUTOINCREMENT,
    date_rendezvous TEXT NOT NULL,
    heure TEXT NOT NULL,
    motif TEXT,
    statut TEXT DEFAULT 'En attente',
    id_patient INTEGER NOT NULL,
    id_medecin INTEGER NOT NULL,
    FOREIGN KEY (id_patient) REFERENCES Patient(id_patient),
    FOREIGN KEY (id_medecin) REFERENCES Medecin(id_medecin)
);

-- TABLE SOIN
CREATE TABLE IF NOT EXISTS Soin (
    id_soin INTEGER PRIMARY KEY AUTOINCREMENT,
    date_soin TEXT NOT NULL,
    libelle TEXT NOT NULL,
    description TEXT,
    id_consultation INTEGER NOT NULL,
    FOREIGN KEY (id_consultation) REFERENCES Consultation(id_consultation)
);

-- TABLE PAIEMENT
CREATE TABLE IF NOT EXISTS Paiement (
    id_paiement INTEGER PRIMARY KEY AUTOINCREMENT,
    date_paiement TEXT NOT NULL,
    montant REAL NOT NULL CHECK (montant > 0),
    mode_paiement TEXT NOT NULL,
    statut TEXT DEFAULT 'En attente',
    id_consultation INTEGER NOT NULL,
    FOREIGN KEY (id_consultation) REFERENCES Consultation(id_consultation)
);
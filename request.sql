-- =================================================
-- PROJET ISI - SEANCE 6 - REQUETES METIER
-- Base : Clinique (Patients, RDV, Paiement)
-- =================================================

-- 1. CREATION DES TABLES
CREATE TABLE Patients (
  id_patient INTEGER PRIMARY KEY,
  nom TEXT NOT NULL,
  prenom TEXT NOT NULL,
  date_naissance DATE,
  telephone TEXT
);

CREATE TABLE RDV (
  id_rdv INTEGER PRIMARY KEY,
  id_patient INTEGER,
  date_rdv DATE NOT NULL,
  statut TEXT CHECK(statut IN ('En attente','Confirme','Termine','Annule')),
  FOREIGN KEY (id_patient) REFERENCES Patients(id_patient)
);

CREATE TABLE Paiement (
  id_paiement INTEGER PRIMARY KEY,
  id_rdv INTEGER,
  montant INTEGER NOT NULL,
  mode_paiement TEXT,
  date_paiement DATE,
  FOREIGN KEY (id_rdv) REFERENCES RDV(id_rdv)
);

-- 2. JEU DE DONNEES DE TEST
INSERT INTO Patients VALUES (1, 'Diallo', 'Aminata', '1990-05-12', '70000001');
INSERT INTO Patients VALUES (2, 'Traore', 'Moussa', '1985-11-03', '70000002');
INSERT INTO Patients VALUES (3, 'Keita', 'Fatoumata', '2000-01-20', '70000003');

INSERT INTO RDV VALUES (1, 1, '2026-11-21', 'Confirme');
INSERT INTO RDV VALUES (2, 1, '2026-11-22', 'En attente');
INSERT INTO RDV VALUES (3, 2, '2026-11-21', 'Termine');
INSERT INTO RDV VALUES (4, 3, '2026-11-23', 'Annule');

INSERT INTO Paiement VALUES (1, 1, 5000, 'Orange Money', '2026-11-21');
INSERT INTO Paiement VALUES (2, 3, 5000, 'Especes', '2026-11-21');

-- =================================================
-- 7. REQUETES METIER (8 requetes)
-- =================================================

-- R1 - JOINTURE 1 : Liste des RDV avec nom du patient
-- Resultat attendu : 4 lignes (Diallo x2, Traore x1, Keita x1)
SELECT Patients.nom, Patients.prenom, RDV.date_rdv, RDV.statut
FROM RDV JOIN Patients ON RDV.id_patient = Patients.id_patient;

-- R2 - JOINTURE 2 : RDV confirmes de demain avec telephone
-- Resultat attendu : 1 ligne (Diallo, 2026-11-21)
SELECT Patients.nom, Patients.telephone, RDV.date_rdv
FROM RDV JOIN Patients ON RDV.id_patient = Patients.id_patient
WHERE RDV.statut = 'Confirme';

-- R3 - JOINTURE 3 : Paiements avec nom du patient
-- Resultat attendu : 2 lignes (Diallo 5000, Traore 5000)
SELECT Patients.nom, Paiement.montant, Paiement.mode_paiement
FROM Paiement
JOIN RDV ON Paiement.id_rdv = RDV.id_rdv
JOIN Patients ON RDV.id_patient = Patients.id_patient;

-- R4 - AGREGATION 1 : Nombre de RDV par statut
-- Resultat attendu : Confirme=1, En attente=1, Termine=1, Annule=1
SELECT statut, COUNT(*) AS nb_rdv FROM RDV GROUP BY statut;

-- R5 - AGREGATION 2 : Total des paiements encaisses
-- Resultat attendu : 10000
SELECT SUM(montant) AS total_encaisse FROM Paiement;

-- R6 - SOUS-REQUETE : Patients qui ont au moins 1 RDV
-- Resultat attendu : Diallo, Traore, Keita (les 3)
SELECT nom, prenom FROM Patients
WHERE id_patient IN (SELECT id_patient FROM RDV);

-- R7 - VUE : Vue des RDV a venir
CREATE VIEW Vue_RDV_A_Venir AS
SELECT Patients.nom, RDV.date_rdv, RDV.statut
FROM RDV JOIN Patients ON RDV.id_patient = Patients.id_patient
WHERE RDV.statut IN ('En attente','Confirme');
-- Pour tester : SELECT * FROM Vue_RDV_A_Venir;
-- Resultat attendu : 3 lignes

-- R8 - CONTROLE QUALITE : RDV sans patient / Paiement sans RDV (doit etre 0)
-- Resultat attendu : 0 ligne = base propre
SELECT * FROM RDV WHERE id_patient NOT IN (SELECT id_patient FROM Patients);

-- =================================================
-- 8. TRANSACTION : Enregistrer un RDV + son Paiement
-- Scenario : Si le paiement echoue, le RDV ne doit PAS etre cree.
-- =================================================
BEGIN;
INSERT INTO RDV VALUES (5, 2, '2026-11-25', 'Confirme');
INSERT INTO Paiement VALUES (3, 5, 5000, 'Orange Money', '2026-11-25');
COMMIT;

-- Test d'annulation (ROLLBACK) : ce RDV ne doit pas exister apres
BEGIN;
INSERT INTO RDV VALUES (6, 3, '2026-11-26', 'En attente');
ROLLBACK;

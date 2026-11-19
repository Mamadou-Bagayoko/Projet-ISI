-- DONNEES DE TEST DU PROJET CENTRE-SANTE-GEST

PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

-- =====================================
-- INSERTION DES 10 PATIENTS
-- =====================================

INSERT INTO Patient (id_patient, nom, prenom, date_naissance, sexe, telephone, adresse) VALUES
(1, 'Traore', 'Moussa', '1995-04-12', 'M', '70000001', 'Bamako'),
(2, 'Diallo', 'Aminata', '2000-08-20', 'F', '70000002', 'Sikasso'),
(3, 'Coulibaly', 'Ibrahim', '1988-02-15', 'M', '70000003', 'Segou'),
(7, 'Sangare', 'Adama', '1988-06-15', 'M', '70000011', 'Bamako'),
(10, 'Diallo', 'Moussa', '1995-04-12', 'M', '76000001', 'Bamako'),
(11, 'Traore', 'Aminata', '1998-07-20', 'F', '76000002', 'Sikasso'),
(12, 'Coulibaly', 'Mamadou', '1990-02-15', 'M', '76000003', 'Segou'),
(13, 'Keita', 'Fatoumata', '2000-11-08', 'F', '76000004', 'Bamako'),
(14, 'Sissoko', 'Ibrahim', '1985-09-25', 'M', '76000005', 'Kati'),
(15, 'Diarra', 'Awa', '1997-06-17', 'F', '76000006', 'Mopti');

-- =====================================
-- INSERTION DES 10 MEDECINS
-- =====================================

INSERT INTO Medecin (id_medecin, nom, prenom, specialite, telephone) VALUES
(1, 'Keita', 'Mamadou', 'Generaliste', '71000001'),
(2, 'Diarra', 'Fatoumata', 'Pediatre', '71000002'),
(5, 'Sissoko', 'Oumar', 'Cardiologue', '71000011'),
(8, 'Diallo', 'Moussa', 'Pediatrie', '77000001'),
(9, 'Traore', 'Aminata', 'Cardiologie', '77000002'),
(10, 'Coulibaly', 'Mamadou', 'Dermatologie', '77000003'),
(11, 'Keita', 'Fatoumata', 'Gynecologie', '77000004'),
(12, 'Sissoko', 'Ibrahim', 'Medecine generale', '77000005'),
(13, 'Diarra', 'Awa', 'Chirurgie', '77000006'),
(14, 'Toure', 'Ousmane', 'Ophtalmologie', '77000007');

-- =====================================
-- INSERTION DES 10 CONSULTATIONS
-- =====================================

INSERT INTO Consultation (id_consultation, date_consultation, motif, diagnostic, id_patient, id_medecin) VALUES
(1, '2026-11-18', 'Fievre et maux de tete', 'Paludisme simple', 1, 1),
(2, '2026-11-18', 'Douleurs abdominales', 'Gastrite', 2, 1),
(3, '2026-11-18', 'Toux et rhume', 'Infection respiratoire', 3, 2),
(4, '2026-11-18', 'Consultation de suivi', 'A determiner', 7, 5),
(5, '2026-11-19', 'Fievre', 'Paludisme suspecte', 10, 8),
(6, '2026-11-19', 'Fatigue', 'Anemie', 11, 9),
(7, '2026-11-19', 'Douleur abdominale', 'Gastrite', 12, 10),
(8, '2026-11-19', 'Maux de tete', 'Migraine', 13, 11),
(9, '2026-11-19', 'Toux', 'Infection respiratoire', 14, 12),
(10, '2026-11-19', 'Douleur oculaire', 'Conjonctivite', 15, 13);

-- =====================================
-- INSERTION DES 10 RENDEZ-VOUS
-- =====================================

INSERT INTO RendezVous (id_rendezvous, date_rendezvous, heure, motif, statut, id_patient, id_medecin) VALUES
(1, '2026-11-20', '09:30', 'Consultation de suivi', 'Confirmé', 7, 5),
(3, '2026-11-21', '08:00', 'Consultation generale', 'En attente', 10, 8),
(4, '2026-11-21', '09:00', 'Suivi medical', 'Confirmé', 11, 9),
(5, '2026-11-21', '10:00', 'Controle medical', 'En attente', 12, 10),
(6, '2026-11-21', '11:00', 'Consultation pediatrique', 'Confirmé', 13, 11),
(7, '2026-11-22', '08:30', 'Suivi traitement', 'En attente', 14, 12),
(8, '2026-11-22', '09:30', 'Consultation generale', 'Confirmé', 15, 13),
(9, '2026-11-22', '10:30', 'Controle', 'En attente', 1, 1),
(10, '2026-11-22', '11:30', 'Suivi', 'Confirmé', 2, 2),
(11, '2026-11-23', '08:00', 'Consultation', 'En attente', 3, 5);

-- =====================================
-- INSERTION DES 10 SOINS
-- =====================================

INSERT INTO Soin (id_soin, date_soin, libelle, description, id_consultation) VALUES
(1, '2026-11-19', 'Pansement medical', 'Realisation dun pansement simple', 4),
(3, '2026-11-19', 'Pansement', 'Pansement simple', 5),
(4, '2026-11-19', 'Injection', 'Injection intramusculaire', 6),
(5, '2026-11-19', 'Perfusion', 'Pose de perfusion', 7),
(6, '2026-11-19', 'Nettoyage plaie', 'Nettoyage et desinfection', 8),
(7, '2026-11-19', 'Prise de tension', 'Mesure de la tension arterielle', 9),
(8, '2026-11-19', 'Vaccination', 'Administration de vaccin', 10),
(9, '2026-11-19', 'Pansement', 'Renouvellement du pansement', 1),
(10, '2026-11-19', 'Injection', 'Injection sous-cutanee', 2),
(11, '2026-11-19', 'Soin local', 'Application de produit antiseptique', 3);

-- =====================================
-- INSERTION DES 10 PAIEMENTS
-- =====================================

INSERT INTO Paiement (id_paiement, date_paiement, montant, mode_paiement, statut, id_consultation) VALUES
(1, '2026-11-19', 5000, 'Espèces', 'Payé', 4),
(3, '2026-11-19', 5000, 'Especes', 'Payé', 5),
(4, '2026-11-19', 7500, 'Orange Money', 'Payé', 6),
(5, '2026-11-19', 10000, 'Especes', 'En attente', 7),
(6, '2026-11-19', 6000, 'Orange Money', 'Payé', 8),
(7, '2026-11-19', 8000, 'Especes', 'Payé', 9),
(8, '2026-11-19', 12000, 'Orange Money', 'En attente', 10),
(9, '2026-11-19', 5000, 'Especes', 'Payé', 1),
(10, '2026-11-19', 9000, 'Orange Money', 'Payé', 2),
(11, '2026-11-19', 7000, 'Especes', 'En attente', 3);

COMMIT;
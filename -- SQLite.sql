-- SQLite
-- Insertion des patients
INSERT INTO Patient (nom, prenom, date_naissance, sexe, telephone, adresse)
VALUES
('Traore', 'Moussa', '1995-04-12', 'M', '70000001', 'Bamako'),
('Diallo', 'Aminata', '2000-08-20', 'F', '70000002', 'Sikasso'),
('Coulibaly', 'Ibrahim', '1988-02-15', 'M', '70000003', 'Segou');

-- Insertion des medecins
INSERT INTO Medecin (nom, prenom, specialite, telephone)
VALUES
('Keita', 'Mamadou', 'Generaliste', '71000001'),
('Diarra', 'Fatoumata', 'Pediatre', '71000002');
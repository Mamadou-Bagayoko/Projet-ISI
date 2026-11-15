# Cahier des Charges v1 - Système d'Enregistrement des Patients à l'Hôpital
**Projet :** Projet-ISI
**Filière :** Informatique / Système d'Information
**Version :** v1 - Séance 2

## 1. Contexte et Objectifs

### Contexte
L'hôpital accueille chaque jour des dizaines de patients. Actuellement l'enregistrement se fait sur papier, ce qui cause des pertes de dossiers, des files d'attente longues et l'impossibilité de retrouver rapidement un patient.

### Objectif Général
Digitaliser l'enregistrement des patients pour gagner du temps et éviter les pertes de dossiers.

### Objectifs Spécifiques
- Enregistrer un patient en moins de 2 minutes
- Retrouver un patient en moins de 10 secondes par son nom ou téléphone
- Avoir la liste des patients du jour automatiquement

## 2. Tableau des Exigences

| Identifiant | Énoncé | Type | Priorité | Critère d'acceptation |
| --- | --- | --- | --- | --- |
| EX-01 | Enregistrer un patient avec nom, prénom, âge, sexe, téléphone, motif | Fonctionnelle | Must | Formulaire complet enregistré en base en < 2 min |
| EX-02 | Rechercher un patient par nom ou téléphone | Fonctionnelle | Must | Résultat affiché en < 10 sec |
| EX-03 | Afficher la liste des patients | Fonctionnelle | Must | Liste complète affichée avec date |
| EX-04 | Modifier les infos d'un patient | Fonctionnelle | Should | Modification sauvegardée et visible |
| EX-05 | Supprimer un patient | Fonctionnelle | Could | Patient n'apparaît plus dans la liste |
| EX-06 | Compter les patients du jour | Fonctionnelle | Should | Nombre correct affiché |
| EX-07 | Le système doit répondre en < 2 sec | Non-fonctionnelle | Must | Temps mesuré avec 50 patients |
| EX-08 | Seul le secrétaire peut enregistrer | Non-fonctionnelle | Must | Accès par mot de passe |
| EX-09 | Les données doivent être sauvegardées même si le PC s'éteint | Non-fonctionnelle | Must | Données retrouvées après redémarrage |
| EX-10 | Interface simple utilisable sans formation | Non-fonctionnelle | Should | Nouvel utilisateur réussit en < 5 min |

## 3. 10 User Stories avec Critères d'Acceptation

1. **En tant que** secrétaire, **je veux** enregistrer un nouveau patient **afin de** créer son dossier. *Critère : le patient apparaît dans la liste après enregistrement.*
2. **En tant que** secrétaire, **je veux** rechercher un patient par son nom **afin de** retrouver son dossier vite. *Critère : recherche "Diallo" affiche tous les Diallo.*
3. **En tant que** secrétaire, **je veux** voir la liste de tous les patients **afin de** suivre l'activité. *Critère : liste triée par date.*
4. **En tant que** secrétaire, **je veux** modifier le téléphone d'un patient **afin de** corriger une erreur. *Critère : nouveau numéro visible après modification.*
5. **En tant que** médecin, **je veux** voir le motif de consultation **afin de** préparer la consultation. *Critère : motif affiché dans le détail.*
6. **En tant que** secrétaire, **je veux** supprimer un doublon **afin de** garder une base propre. *Critère : patient supprimé ne réapparaît pas.*
7. **En tant que** chef de service, **je veux** connaître le nombre de patients du jour **afin de** faire le rapport. *Critère : chiffre exact du jour.*
8. **En tant que** secrétaire, **je veux** être alerté si le téléphone est déjà enregistré **afin d'**éviter les doublons. *Critère : message d'alerte affiché.*
9. **En tant que** secrétaire, **je veux** que le système garde la date automatique **afin de** ne pas la taper. *Critère : date du jour enregistrée automatiquement.*
10. **En tant que** administrateur, **je veux** sauvegarder la base **afin de** ne pas perdre les données. *Critère : fichier base.db copié.*

## 4. 5 Exigences Non-Fonctionnelles Mesurables

1. **Performance :** Recherche d'un patient en moins de 2 secondes avec 100 patients.
2. **Fiabilité :** 0 perte de données après coupure, données dans SQLite.
3. **Sécurité :** Accès à l'enregistrement réservé par mot de passe.
4. **Utilisabilité :** Un nouvel utilisateur enregistre un patient en moins de 5 minutes sans aide.
5. **Portabilité :** Fonctionne sur Windows sans internet, avec Python 3 et VS Code.

## 5. Backlog Produit Ordonné

| Priorité | User Story | Estimation relative |
| --- | --- | --- |
| 1 | Enregistrer patient | 5 points |
| 2 | Rechercher patient | 3 points |
| 3 | Afficher liste | 2 points |
| 4 | Modifier patient | 3 points |
| 5 | Compter patients du jour | 2 points |
| 6 | Supprimer patient | 2 points |
| 7 | Alerte doublon | 3 points |

## 6. Priorisation MoSCoW

- **Must :** Enregistrer, Rechercher, Afficher liste. Justification : Sans ça, l'hôpital ne peut pas fonctionner, c'est le coeur du métier.
- **Should :** Modifier, Compter du jour. Important mais l'hôpital peut tourner sans le 1er jour.
- **Could :** Supprimer, Alerte doublon. Confort, à faire si on a le temps.
- **Won't :** Paiement en ligne, Application mobile. Pas pour cette version.

## 7. Choix de la Démarche

On choisit la démarche **Agile itérative**. Le besoin du secrétaire est assez stable, mais il faut montrer vite une version qui marche pour avoir son retour. On fait par petits cycles : version 1 enregistrement, version 2 recherche, version 3 modification. Cela permet de corriger rapidement si le client n'est pas satisfait, sans attendre la fin du projet.

## 8. Technologies Utilisées

- **Langage :** Python 3
- **Base de données :** SQLite (base.db)
- **Éditeur :** VS Code
- **Gestion de version :** GitHub - Projet-ISI
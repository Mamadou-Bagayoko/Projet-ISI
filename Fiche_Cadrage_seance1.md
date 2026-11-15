# Fiche de Cadrage - Séance 1
**Projet :** Gestion des Patients - Centre de Santé
**Auteur :** Mamadou Bagayoko; Abdoulaye Cisse; Mohamed Sogodogo - Projet ISI

## 1. Contexte et Problème à Résoudre
Aujourd'hui, l'enregistrement des patients se fait sur des carnets papier et des fiches volantes au centre de santé.

Problèmes constatés :
- Perte fréquente des dossiers patients
- Temps d'enregistrement très long (environ 10 min par patient)
- Difficulté à retrouver l'historique d'un patient
- Risque d'erreur (nom mal écrit, doublons)

Le projet vise à remplacer ce système papier par une application simple, locale, sans internet, qui permet d'enregistrer, rechercher et suivre les patients.

## 2. Périmètre : Inclus et Exclu

**Inclus :**
- Enregistrement d'un nouveau patient (nom, âge, contact, motif)
- Recherche d'un patient en moins de 2 secondes
- Affichage de la liste des patients
- Sauvegarde des données en base SQLite
- Accès protégé par mot de passe

**Exclu :**
- Gestion des médicaments et de la pharmacie
- Gestion des rendez-vous en ligne
- Paiement / facturation
- Application mobile / site web en ligne
- Connexion à d'autres hôpitaux

## 3. Acteurs et Parties Prenantes

| # | Partie prenante | Rôle | Influence | Intérêt |
|---|---|---|---|---|
| 1 | Patient | Utilise le service, donne ses infos | Faible | Fort - être vite pris en charge |
| 2 | Agent d'accueil / Secrétaire | Enregistre les patients | Forte | Fort - gagner du temps |
| 3 | Infirmier / Médecin | Consulte le dossier | Moyenne | Fort - retrouver l'historique |
| 4 | Chef du centre | Valide le projet | Forte | Moyen - bonne organisation |
| 5 | Développeur (Mamadou) | Réalise l'application | Forte | Fort - réussir le projet ISI |
| 6 | Enseignant ISI (DSamake) | Encadre et évalue | Forte | Moyen - respect du cadrage |
| 7 | Famille du patient | Accompagne le patient | Faible | Moyen - informations fiables |

## 4. Objectifs Mesurables

1. Réduire de moitié le temps d'enregistrement : passer de 10 min à 5 min max par patient.
2. Rechercher un patient en moins de 2 secondes avec 100 patients enregistrés.
3. Zéro perte de données après coupure : toutes les données dans SQLite.
4. Un nouvel utilisateur enregistre un patient seul en moins de 5 minutes sans aide.
5. Application qui fonctionne sur Windows, sans internet, avec Python 3 et VS Code.

## 5. Risques et Hypothèses

**Risques :**
- Coupure de courant pendant l'enregistrement -> Perte de données
- Mot de passe oublié -> Blocage de l'accès
- Erreur de saisie (nom mal orthographié) -> Doublons
- PC non disponible au centre

**Hypothèses :**
- Le centre dispose d'un PC Windows avec Python 3
- L'agent d'accueil sait utiliser un clavier / souris
- Les patients acceptent de donner leurs informations
- Le projet reste en local, sans besoin d'internet

---
**À retenir :** Un SI est un ensemble organisé d'acteurs, de processus, de données et de technologies. Un bon cadrage évite la plupart des échecs de projet.
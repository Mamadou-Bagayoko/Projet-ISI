# Séance 7 - Risques, Sécurité et Droits
## Projet : Gestion des Patients - Clinique ISI

### 1. LES 8 RISQUES

| N° | Risque | Probabilité (1-3) | Gravité (1-3) | Score (P x G) |
| --- | --- | --- | --- | --- |
| R1 | Perte de données (panne PC, pas de sauvegarde) | 2 | 3 | 6 |
| R2 | Fuite de données patients (téléphone, dossier médical) | 2 | 3 | 6 |
| R3 | Accès non autorisé (quelqu'un utilise le compte d'un autre) | 3 | 2 | 6 |
| R4 | Double RDV / Erreur de saisie (mauvais patient) | 3 | 2 | 6 |
| R5 | Paiement perdu / non enregistré (Orange Money sans preuve) | 2 | 2 | 4 |
| R6 | Panne internet / Coupure électricité pendant la saisie | 3 | 1 | 3 |
| R7 | Suppression par erreur d'un patient | 1 | 3 | 3 |
| R8 | Refus d'utilisation par le personnel (trop compliqué) | 2 | 2 | 4 |

**Légende :** 1 = Faible, 2 = Moyen, 3 = Élevé

### 2. LES 5 RISQUES LES PLUS ÉLEVÉS + MESURES

**R1 - Perte de données (Score 6)**
- Mesure : Sauvegarde automatique chaque soir sur clé USB + Google Drive
- Mesure : Export CSV chaque vendredi

**R2 - Fuite de données (Score 6)**
- Mesure : Mot de passe obligatoire, jamais partagé
- Mesure : Ne jamais envoyer la liste des patients sur WhatsApp

**R3 - Accès non autorisé (Score 6)**
- Mesure : Déconnexion automatique après 10 min d'inactivité
- Mesure : Chaque utilisateur a son propre compte

**R4 - Double RDV / Erreur de saisie (Score 6)**
- Mesure : Le système bloque si le patient a déjà un RDV à la même heure
- Mesure : Confirmation "Voulez-vous enregistrer Diallo Aminata ?" avant validation

**R5 - Paiement perdu (Score 4)**
- Mesure : Reçu obligatoire avec numéro de paiement
- Mesure : Transaction SQL : RDV + Paiement enregistrés ensemble, sinon rien

### 3. MATRICE DES DROITS (Rôles et Fonctions)

| Fonction | Secrétaire / Accueil | Médecin | Admin / Directeur |
| --- | --- | --- | --- |
| Voir la liste des patients | ✅ Oui | ✅ Oui | ✅ Oui |
| Créer / Modifier un patient | ✅ Oui | ❌ Non | ✅ Oui |
| Créer / Annuler un RDV | ✅ Oui | ✅ Oui | ✅ Oui |
| Enregistrer un paiement | ✅ Oui | ❌ Non | ✅ Oui |
| Voir le total encaissé | ❌ Non | ❌ Non | ✅ Oui |
| Supprimer un patient | ❌ Non | ❌ Non | ✅ Oui |
| Créer un compte utilisateur | ❌ Non | ❌ Non | ✅ Oui |

**Règle :** La secrétaire ne voit pas l'argent total, le médecin ne touche pas aux paiements, seul l'Admin peut supprimer.
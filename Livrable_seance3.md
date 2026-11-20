# Livrable Séance 3 - Modélisation BPMN et Cas d'Utilisation
**Projet :** Gestion des Patients - Centre de Santé
**Auteur :** Mamadou Bagayoko; Abdoulaye Cisse et Mohamed Sogodogo - Projet ISI

## 1. Acteurs et Cas d'Utilisation (à partir des exigences Must)

| Acteur | Cas d'utilisation |
|---|---|
| Agent d'accueil | Enregistrer un patient |
| Agent d'accueil | Rechercher un patient |
| Agent d'accueil | Modifier les infos d'un patient |
| Médecin / Infirmier | Consulter le dossier d'un patient |
| Administrateur | Gérer le mot de passe / Accès |

## 2. Relations : 1 Inclusion + 1 Extension

**1. Inclusion (obligatoire) :**
*Enregistrer un patient* **<<include>>** *Vérifier doublon*
Justification : À chaque enregistrement, on DOIT vérifier si le patient existe déjà pour éviter les doublons. C'est obligatoire.

**2. Extension (optionnelle) :**
*Enregistrer un patient* **<<extend>>** *Ajouter antécédent médical*
Justification : On ajoute un antécédent SEULEMENT si le patient en a un. Ce n'est pas obligatoire à chaque fois.

## 3. Descriptions Textuelles des 2 Cas Clés

### Cas Clé 1 : Enregistrer un nouveau patient
**Acteur :** Agent d'accueil
**Objectif :** Créer le dossier d'un patient qui vient pour la première fois.

**Scénario principal (cas normal) :**
1. Le patient arrive à l'accueil et donne son nom.
2. L'agent tape le nom dans l'application.
3. Le système vérifie qu'il n'existe pas déjà.
4. L'agent remplit nom, âge, contact, motif.
5. L'agent clique sur Enregistrer.
6. Le système sauvegarde dans SQLite et affiche "Patient enregistré".

**Alternative : Le patient existe déjà**
À l'étape 3, si le système trouve le patient, il affiche son dossier. L'agent ne crée pas de doublon, il met juste à jour le motif.

**Erreur : Informations incomplètes**
À l'étape 4, si le nom est vide ou le contact est manquant, le système refuse l'enregistrement et affiche : "Veuillez compléter le nom et le contact". L'agent corrige et réessaie.

### Cas Clé 2 : Rechercher un patient
**Acteur :** Agent d'accueil / Médecin
**Objectif :** Retrouver rapidement le dossier d'un patient.

**Scénario principal (cas normal) :**
1. L'acteur tape le nom ou le numéro du patient.
2. Le système recherche dans la base.
3. Le système affiche le dossier en moins de 2 secondes.
4. L'acteur consulte l'historique.

**Alternative : Plusieurs homonymes**
À l'étape 3, si 2 patients ont le même nom, le système affiche la liste avec l'âge et le contact pour choisir le bon.

**Erreur : Patient introuvable**
À l'étape 3, si aucun patient ne correspond, le système affiche : "Aucun patient trouvé". L'acteur vérifie l'orthographe ou crée un nouveau patient.

## 4. Comparaison As Is / To Be - 3 Gains Attendus

| Critère | As Is (Papier Actuel) | To Be (Application Cible) | Gain |
|---|---|---|---|
| Temps d'enregistrement | 10 min | 5 min max | 2x plus rapide |
| Recherche d'un dossier | 5 à 10 min dans les carnets | Moins de 2 secondes | Quasi instantané |
| Perte de dossier | Fréquente | 0 - Sauvegarde SQLite | Fiabilité totale |

## 5. Diagrammes à joindre (à faire dans draw.io)

À exporter en PDF ou image et mettre dans le même dossier GitHub :
1. `As_Is_Processus_Actuel.png` - Patient arrive -> Attend -> Écrit sur carnet -> Cherche dans les carnets -> Dossier perdu ?
2. `To_Be_Processus_Cible.png` - Patient arrive -> Agent tape le nom -> Recherche 2 sec -> Enregistré dans SQLite
3. `Diagramme_Cas_Utilisation.png` - Les 3 bonhommes (Agent, Médecin, Admin) reliés aux ovales (Enregistrer, Rechercher, Consulter, Gérer mot de passe)

**À retenir :** BPMN décrit comment le travail s'organise, les cas d'utilisation décrivent ce que le système apporte aux acteurs. L'un sert à dériver l'autre.

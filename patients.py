import sqlite3
from datetime import date

# Créer la base
conn = sqlite3.connect("base.db")
cur = conn.cursor()
cur.execute("""
CREATE TABLE IF NOT EXISTS patients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT,
    prenom TEXT,
    age INTEGER,
    sexe TEXT,
    telephone TEXT,
    motif TEXT,
    date_enregistrement TEXT
)
""")
conn.commit()

# Enregistrer un patient
def enregistrer():
    print("--- Nouvel Enregistrement ---")
    nom = input("Nom : ")
    prenom = input("Prénom : ")
    age = input("Âge : ")
    sexe = input("Sexe (M/F) : ")
    tel = input("Téléphone : ")
    motif = input("Motif de consultation : ")

    cur.execute("INSERT INTO patients (nom, prenom, age, sexe, telephone, motif, date_enregistrement) VALUES (?,?,?,?,?,?,?)",
                (nom, prenom, age, sexe, tel, motif, str(date.today())))
    conn.commit()
    print("Patient enregistré ! ✅")

# Voir la liste
def afficher():
    cur.execute("SELECT * FROM patients")
    for p in cur.fetchall():
        print(p)

# Menu
while True:
    print("\n1. Enregistrer patient")
    print("2. Voir liste")
    print("3. Quitter")
    choix = input("Choix : ")
    if choix == "1":
        enregistrer()
    elif choix == "2":
        afficher()
    else:
        break
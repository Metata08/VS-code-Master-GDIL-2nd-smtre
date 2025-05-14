
import tkinter as tk
from tkinter import ttk

class Tasbih:
    def __init__(self, master):
        self.master = master
        master.title("Tasbih Digital")

        self.compteur = 0
        self.cible = 33  # Par défaut, un cycle de tasbih traditionnel

        # Widgets
        self.label_compteur = ttk.Label(master, text="0", font=("Helvetica", 48))
        self.label_compteur.pack(pady=20)

        self.bouton_compter = ttk.Button(master, text="Compter", command=self.incrementer)
        self.bouton_compter.pack(pady=10)

        self.bouton_reinitialiser = ttk.Button(master, text="Réinitialiser", command=self.reinitialiser)
        self.bouton_reinitialiser.pack(pady=5)

        self.label_cible = ttk.Label(master, text=f"Cible: {self.cible}", font=("Helvetica", 12))
        self.label_cible.pack(pady=5)

        self.entree_cible = ttk.Entry(master, width=5)
        self.entree_cible.pack(pady=2)
        self.entree_cible.insert(0, str(self.cible))

        self.bouton_modifier_cible = ttk.Button(master, text="Modifier Cible", command=self.modifier_cible)
        self.bouton_modifier_cible.pack(pady=5)

        self.label_message = ttk.Label(master, text="", font=("Helvetica", 12, "italic"))
        self.label_message.pack(pady=10)

    def incrementer(self):
        self.compteur += 1
        self.label_compteur.config(text=str(self.compteur))
        self.verifier_cible()

    def reinitialiser(self):
        self.compteur = 0
        self.label_compteur.config(text="0")
        self.label_message.config(text="")

    def modifier_cible(self):
        try:
            nouvelle_cible = int(self.entree_cible.get())
            if nouvelle_cible > 0:
                self.cible = nouvelle_cible
                self.label_cible.config(text=f"Cible: {self.cible}")
                self.reinitialiser()  # Réinitialiser pour commencer un nouveau cycle
            else:
                self.label_message.config(text="La cible doit être positive.")
        except ValueError:
            self.label_message.config(text="Entrée invalide. Utilisez un nombre entier.")

    def verifier_cible(self):
        if self.compteur >= self.cible:
            self.label_message.config(text="Cible atteinte!")

root = tk.Tk()
tasbih = Tasbih(root)
root.mainloop()

# TP à rendre

# Étudiant : Mouhamadou Gueye  P31 2127

==========================================================================================


##  Contenu du projet

Ce TP porte sur l'utilisation des technologies XML, en particulier les parseurs   DOM et SAX, ainsi que le langage XPath pour l'extraction de données structurées.

### Fichiers fournis :


Exercice 1: 
- `population.xml` : fichier généré(`JUSTIFICATION:`fichier.xml non fourni ) contenant des tranches d’âge avec nbHommes / nbFemmes pour SAX.
- `PopulationTrancheHandler.java` : analyse SAX sur `population.xml` pour compter les individus de 18 à 25 ans.


Exercice 2: 
- `dblp.dtd` : fichier DTD officiel du jeu de données DBLP.
- `dblp.xml` : fichier XML personnalisé(`Justification !:` le fichier dblp.xml est trop grand(4GB) pour se tenir dans la memoir lors de l'utilisation de DOM ), conforme au DTD, contenant :
  - Des publications fictives et réelles (articles, conférences, pages personnelles).
  - Deux entrées avec `<booktitle>CNRIA2022</booktitle>` pour l'exercice2 .

- `Modifier.java` : modification d’un fichier XML avec DOM (mdate, ajout d’auteur, changement de titre).
- `ListePubAuteurViaSAX.java` et `MainPublications.java` : extraction des publications d’un auteur avec SAX.
- `ListePubViaXPATH.java` : utilisation de XPath pour afficher les publications (titre + auteurs) de la conférence CNRIA2022.

---

##  Objectifs atteints :

-  Manipulation de documents XML valides selon un DTD
-  Traitement SAX avec filtrage d’attributs
-  Parsing et modification de structure DOM
-  Extraction ciblée avec XPath
-  Création de documents XML légers et bien formés

---

## Remarques

- Le fichier `dblp.xml` a été allégé pour garantir un traitement fluide sur ma machine.
- Tous les traitements DOM/SAX ont été testés en local avec Java SE.
- L'intégration de champs comme `<note type="photo">` respecte la DTD via l'utilisation d'éléments `%field;`.

---

## Pré-requis

- JDK 8 ou supérieur
- Éditeur Java (Eclipse ou VS Code,....)
- Fichiers `dblp.dtd` et `dblp.xml` dans le même répertoire (/src)

---



**Mouhamadou Gueye**  

Code : p31 2127


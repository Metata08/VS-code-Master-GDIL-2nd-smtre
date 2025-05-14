<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Etudiant</title>
    <link rel="stylesheet" href="{{ asset('css/bootstrap-5.3.3-dist/css/bootstrap.css') }}">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
</head>

<body>
    <div class="container border">

        <nav class="navbar d-flex">
            <div class="row">
                <a class="navbar-brand d-inline-flex p-2" href="#">
                    <div class="col">
                        <img src="{{ asset('img/Africa_(orthographic_projection).svg.png') }}" alt="Logo" width="80" height="80" class="d-inline-block align-text-top">

                    </div>
                    <div class="col d-flex align-items-end">
                        <h2 class="titre_logo mb-0">POÉSIE AFRICAINE</h2>
                    </div>
                </a>


            </div>
        </nav>

        <div class="row d-flex bar_menu">

            <div class="col-6 col-sm-4 col-md-1 ">

            </div>

            <div class="col-6 col-sm-4 col-md-1 border-end d-flex text-align-item-center">
                <img src="{{ asset('img/Paomedia-Small-N-Flat-House.512.png') }}" alt="icon.accueil" width="20" height="20">

                <a class="nav-link active" aria-current="page" href="#">Accueil</a>
            </div>

            <div class="col-6 col-sm-4 col-md-1 border-end text-center">
                <a class="nav-link" href="#">Poèmes</a>
            </div>

            <div class="col-6 col-sm-4 col-md-1 border-end text-center">
                <a class="nav-link" href="#">Auteurs</a>
            </div>

            <div class="col-6 col-sm-4 col-md-2 border-end text-center">
                <a class="nav-link text-nowrap" href="#">Contactez-nous</a>
            </div>

            <div class="col-3 d-none d-md-block"></div>

            <div class="col-12 col-md-3 mt-3 mt-md-0">
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Recherche" aria-label="Search">
                    <button class="btn btn-secondary " type="submit"></button>
                </form>
            </div>
        </div>
        <!-- recuperation des etudiants depuis la base  -->

        <a class href="{{ url('/form_ajout') }}">Ajouter un etudiant</a>

        <table class="table">
            <thead>
                <tr>
                    <th scope="col">id</th>
                    <th scope="col">Code Etudiant</th>


                    <th scope="col">Nom</th>
                    <th scope="col">Premon</th>
                    <th scope="col">Adresse</th>
                    <th scope="col">Telephone</th>

                </tr>
            </thead>
            <tbody>
                @foreach ($etudiants_in_view as $etudiant )


                <tr>
                    <th scope="row">{{$etudiant->id}}</th>
                    <td>{{$etudiant->code_etudiant}}
                    <td>{{$etudiant->nom}}</td>
                    <td>{{$etudiant->prenom}}</td>
                    <td>{{$etudiant->adresse}}</td>
                    <td>{{$etudiant->telephone}}</td>

                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
        <!-- formulaire pour ajouter un etudiant dans la base  -->

        <!-- <form action="" method="post">
            <label for="code_etudiant">Code Etudiant </label>
            <input type="text" name="code_etudiant" id="code_etudaint">
            <label for="nom">Nom :</label>
            <input type="text">
            <label for="prenom">Prenom :</label>
            <input type="text" name="prenom" id="Prenom">4
            <label for="adresse">Adresse :</label>
            <input type="text">
            <input type="submit" value="Enregistrer"></input>

        </form> -->
    </div>

</body>

<footer class="bg-dark text-white py-4 container">
    <div class="container">
        <div class="row">
            <!-- Ligne du bas : Droits d'auteur -->
            <div class="row mt-4">
                <div class="col-12 text-center foot">
                    <p class=" mb-0">&copy; 2023 Poésie Africaine. Tous droits réservés.</p>
                </div>
            </div>
        </div>
</footer>

</html>
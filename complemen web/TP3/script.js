$(document).ready(function () {

    function updateFullName() {
        var etatCivil = $('#listeEtat').val();
        var nom = $('#nom').val();
        var prenom = $('#prenom').val();

        $('#fullName').val(`${etatCivil} ${prenom} ${nom}`)
    }

    $('#listeEtat, #nom, #prenom').on('input', updateFullName);


    // valeur de niveau de JS

    $("#nivJS").on("input", function () {
        $('#valNiveau').text($(this).val() + " %");
    });

    // affichage du mot de passe 

    $('#hide_password').on("change", function () {
        var contenuType
        if ($('#hide_password').is(':checked'))
            contenuType = 'text'
        else
            contenuType = 'password';

        $('#password, #conf_passworod').attr('type', contenuType);

    });


    // le button est desactivee si un champ de la formulaire n'est pas rempli

    function validerFormulaire() {
        let valider = true;
        $('input').each(function () {
            if ($(this).val() === '' && $(this).attr('type') !== 'checkbox')
                valider = false;
        });
        $('#bntEnvoyer').prop('disabled', !valider);
    }
    $('input').on('input', validerFormulaire);
    $("*").on('click', validerFormulaire);

    // le nom des champ vide apparait en rouge 

    function apparanceRouge() {
        $('input').each(function () {
            if ($(this).val() === '' && $(this).attr('type') !== 'checkbox')
                // !!! comment acceder aux parents et redescendre au fils autremaent  ?
                $(this).parent().parent().children().children('label').addClass('rouge')
            else
                $(this).parent().parent().children().children('label').removeClass('rouge')
        });
    }
    $('input').on('input', apparanceRouge);



    // Le bouton envoyer est désactivé lorsque les 2 champs mot de passe ne coïncident pas

    function validerMDP() {
        let valider = true;
        $('#password,#conf_password').each(function () {
            if ($('#password').val() !== $('#conf_password').val() || $(this).val() === '')
                valider = false;
        });
        $('#bntEnvoyer').prop('disabled', !valider);
    }
    validerMDP();
    $("*").on('click', validerMDP);



    // Le champ mot de passe (confirmation) apparait en rouge tant que son contenu n’est pas égal à celui du champ mot de passe.
    function correspondanceMDP() {

        if ($('#password').val() !== $('#conf_password').val()) {
            $('#conf_password').addClass('rougePW');
            // $('#bntEnvoyer').prop('disabled', true);

        }
        else
            $('#conf_password').removeClass('rougePW');
    }
    $('#password','#conf_password').on('input', correspondanceMDP);
    $("*").on('click', correspondanceMDP);



    // Le champ date de naissance ne peut contenir que des dates entre aujourd’hui et il y a 50ans, en générant la date du jour avec JavaScript.

    const ajrd_8 = new Date();
    const dif50Ans = new Date();
    dif50Ans.setFullYear(ajrd_8.getFullYear() - 50);
    const formatDate = (date) => {
        const jour = String(date.getDate()).padStart(2, '0');
        const mois = String(date.getMonth() + 1).padStart(2, '0');
        const annee = date.getFullYear();
        return `${annee}-${mois}-${jour}`;
    };
    $('#date_naiss').attr('max', formatDate(ajrd_8));
    $('#date_naiss').attr('min', formatDate(dif50Ans));

});
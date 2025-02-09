
$(document).ready(function () {
    // e. Mettre à jour le champ nom complet
    function updateFullName() {
        const etatCivil = $('#listeEtat').val();
        const nom = $('#nom').val();
        const prenom = $('#prenom').val();
        $('#fullName').val(`${etatCivil} ${prenom} ${nom}`);
    }
    $('#listeEtat, #nom, #prenom').on('input', updateFullName);

    // f. Afficher la valeur du niveau en JavaScript
    $('#niveau').on('input', function () {
        $('#niveauValue').text($(this).val());
    });

    // g. Afficher le mot de passe en clair
    $('#showPassword').on('change', function () {
        const type = $(this).is(':checked') ? 'text' : 'password';
        $('#password, #confirmPassword').attr('type', type);
    });

    // h. Désactiver le bouton envoyer si un champ est vide
    function validateForm() {
        let isValid = true;
        $('input').each(function () {
            if ($(this).val() === '' && $(this).attr('type') !== 'checkbox') {
                isValid = false;
                $(this).addClass('error');
            } else {
                $(this).removeClass('error');
            }
        });
        $('#submitBtn').prop('disabled', !isValid);
    }
    $('input').on('input', validateForm);

    // j. Désactiver le bouton envoyer si les mots de passe ne coïncident pas
    function validatePasswords() {
        const password = $('#password').val();
        const confirmPassword = $('#confirmPassword').val();
        if (password !== confirmPassword) {
            $('#confirmPassword').addClass('error');
            $('#submitBtn').prop('disabled', true);
        } else {
            $('#confirmPassword').removeClass('error');
            validateForm();
        }
    }
    $('#password, #confirmPassword').on('input', validatePasswords);

    // l. Restreindre la date de naissance
    const today = new Date();
    const fiftyYearsAgo = new Date();
    fiftyYearsAgo.setFullYear(today.getFullYear() - 50);
    const formatDate = (date) => {
        const day = String(date.getDate()).padStart(2, '0');
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const year = date.getFullYear();
        return `${year}-${month}-${day}`;
    };
    $('#dateNaissance').attr('max', formatDate(today));
    $('#dateNaissance').attr('min', formatDate(fiftyYearsAgo));

    // m. Soumettre le formulaire et afficher les informations
    $('#formulaire').on('submit', function (event) {
        event.preventDefault();
        const formData = $(this).serializeArray();
        let result = '<h2>Informations saisies</h2><ul>';
        formData.forEach(item => {
            result += `<li><strong>${item.name}:</strong> ${item.value}</li>`;
        });
        result += '</ul>';
        $('#formulaire').hide();
        $('#result').html(result);
    });

    // Initial validation
    validateForm();
});
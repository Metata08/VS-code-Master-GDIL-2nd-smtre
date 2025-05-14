<?php

use App\Http\Controllers\etudiantController;
use Illuminate\Support\Facades\Route;


Route::get('/', function () {
    return view('welcome');
});

Route::get('/etudiant', [etudiantController::class,'afficherEtudiant']);
Route::get('/form_ajout', [etudiantController::class,'formAjouterEtudiant']);




// Route::get('/etudiant', 'etudiantt@afficherEtudiant');

// Route::get('/etudiant', [etudiantt::class,'afficherEtudiant']);
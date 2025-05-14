<?php

namespace App\Http\Controllers;

use App\Models\etudiant;
use Illuminate\Http\Request;

class etudiantController extends Controller
{

    // method pour afficher un etudiant
    public function afficherEtudiant()
    {
        // $etudiants = etudiant::getEtudiants();
        $etudiants= Etudiant::all();

        return view('etudiant',['etudiants_in_view' => $etudiants]);
    }

    public function formAjouterEtudiant()
    {
       
        return view('form_ajout');
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(etudiant $etudiant)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(etudiant $etudiant)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, etudiant $etudiant)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(etudiant $etudiant)
    {
        //
    }
}

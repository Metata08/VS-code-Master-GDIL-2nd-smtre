<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class etudiant extends Model
{
    use HasFactory;

    // method   get etudiant
   /*  public static function  getEtudiants(){
        $etudiants= DB::table('etudiants')
        ->select('id','code_etudiant','nom','prenom','adresse','telephone','date_naissance')
        ->get();

        return $etudiants ;
    }
 */

}

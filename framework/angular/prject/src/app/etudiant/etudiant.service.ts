import { Injectable } from '@angular/core';


// pour faire des appels  api
import { HttpClient } from '@angular/common/http';


// pour les observables
import { Observable } from 'rxjs';


// pour les models
import { Etudiant } from './etudiant.model';

@Injectable({
  providedIn: 'root'
})
export class EtudiantService {
  // url de l'api
  private  apiUrl = 'http://localhost/mg4/Bootstrap/etudiant/index.php'
  constructor(private http: HttpClient) {}

  //  recuperation de l'etudiant 

  getEtudiants(): Observable<Etudiant[]>{
    return this.http.get<Etudiant[]>(this.apiUrl);
  }

}

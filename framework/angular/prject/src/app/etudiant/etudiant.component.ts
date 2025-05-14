import { Etudiant } from './etudiant.model';
import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';

import { EtudiantService } from './etudiant.service';

@Component({
  selector: 'app-etudiant',
  imports: [CommonModule],
  templateUrl: './etudiant.component.html',
  styleUrl: './etudiant.component.css'
})
export class EtudiantComponent {

  idEtudiant: number = 0;
  // liste d'etudians  en json


  // etudiants: any = [
  //   { id: 100, nom: 'John Doe', prenom: 'John', age: 20 },
  //   { id: 101, nom: 'Jane Doe', prenom: 'Jane', age: 25 },
  //   { id: 102, nom: 'Bob Doe', prenom: 'Bob', age: 30 },
  // ];

  etudiants: Etudiant[] =
    [
      { id: 100, nom: 'John Doe', prenom: 'John', age: 20 },
      { id: 101, nom: 'Jane Doe', prenom: 'Jane', age: 25 },
      { id: 102, nom: 'Bob Doe', prenom: 'Bob', age: 30 },
    ];


  listEtudiants: any = [];



  constructor(private etudiantService: EtudiantService) { }

  ngOnInit(): void {
    //Called after the constructor, initializing input properties, and the first call to ngOnChanges.
    //Add 'implements OnInit' to the class.

    // this.setEtudiant(100);
    // this.listEtudiants = this.getListEtudiant();

    this.listEtudiants = this.getListEtudiantFromApi();
  }

  // function setEtudiant
  setEtudiant(id: number): void {
    this.idEtudiant = id;
  }
  // function getEtudiant
  getEtudiant(): number {
    return this.idEtudiant;
  }

  // getListEtudiant() {
  //   return this.etudiants;
  // }


  getListEtudiantFromApi() {
    // Faire appel à l'API pour récupérer la liste des étudiants
    // et mettre à jour la liste en conséquence

    this.etudiantService.getEtudiants().subscribe(data => {
      this.listEtudiants = data;
    }
    )
  }


}

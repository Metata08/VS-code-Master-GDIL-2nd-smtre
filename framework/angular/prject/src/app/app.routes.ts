import { Routes } from '@angular/router';
import { EtudiantComponent } from './etudiant/etudiant.component';

export const routes: Routes = [
    {
        path: '', component: EtudiantComponent
    },


    { path: 'etudiant', component: EtudiantComponent }];
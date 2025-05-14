import { Component } from '@angular/core';

@Component({
  selector: 'app-login',
  imports: [],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {
  onLogin() {
    // Simulation d'authentification
    localStorage.setItem('authToken', 'fake-token');
    // Redirection vers le fil d'actualité
  }
}
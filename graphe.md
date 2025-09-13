```graph TD
    subgraph Schéma en Étoile 2
        B[<b>Fait_Ressources_Sante</b><br/><i>(Table de Faits)</i>]

        subgraph Mesures (Faits)
            M7(Utilisation_des_ressources)
            M8(Taux_d_hospitalisation)
            M9(Nombre_de_patients_hospitalises)
        end

        subgraph Dimensions
            D7[<b>Dim_Systeme_Sante</b>]
            D8[<b>Dim_Geographie</b>]
            D9[<b>Dim_Temps</b>]
            D10[<b>Dim_Statut_Epidemie</b>]
        end

        B --- D7
        B --- D8
        B --- D9
        B --- D10

        B -- Contient --> M7
        B -- Contient --> M8
        B -- Contient --> M9

        subgraph Attributs Dim_Systeme_Sante
            D7_1(Hospital_Capacity)
            D7_2(Healthcare_Personnel_Availability)
            D7_3(Hospitalization_Requirement)
        end
        D7 --- D7_1 & D7_2 & D7_3

        subgraph Attributs Dim_Geographie
            D8_1(Location)
            D8_2(Population_Density)
        end
        D8 --- D8_1 & D8_2

        subgraph Attributs Dim_Temps
            D9_1(Date_complete)
            D9_2(Annee)
            D9_3(Mois)
        end
        D9 --- D9_1 & D9_2 & D9_3

        subgraph Attributs Dim_Statut_Epidemie
            D10_1(Outbreak_Status)
            D10_2(Infection_Risk_Level)
        end
        D10 --- D10_1 & D10_2
    end

    style B fill:#f9f,stroke:#333,stroke-width:2px
    style D7 fill:#bbf,stroke:#333,stroke-width:2px
    style D8 fill:#bbf,stroke:#333,stroke-width:2px
    style D9 fill:#bbf,stroke:#333,stroke-width:2px
    style D10 fill:#bbf,stroke:#333,stroke-width:2px ```

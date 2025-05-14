# Fonction pour calculer l'information mutuelle
def info_mutuelle(pu, po):
    pu = pu[:, np.newaxis]  # Transformer en matrice colonne (2D)
    po = po[np.newaxis, :]  # Transformer en matrice ligne (2D)

    matrice_pro = pu * po  # Produit matriciel
    marginal_u = np.sum(matrice_pro, axis=1, keepdims=True)
    marginal_o = np.sum(matrice_pro, axis=0, keepdims=True)

    with np.errstate(divide='ignore', invalid='ignore'):
        mi_matrix = matrice_pro * np.log(matrice_pro / (marginal_u * marginal_o))
        mi_matrix = np.nan_to_num(mi_matrix)  # Gérer les NaN

    return np.sum(mi_matrix)
   
 
 
 # Calcul de l'information mutuelle avec valeur absolue
mi_scores = np.abs(np.array([[info_mutuelle(PU[u], PO[o])
                   for o in range(len(items))] for u in range(len(users))]))
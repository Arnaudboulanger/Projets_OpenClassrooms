SELECT * FROM utilisateur 
INNER JOIN commandes ON commandes.id_utilisateur = utilisateur.id_utilisateur 
INNER JOIN ligne_commande ON ligne_commande.id_commande = commandes.id_commande
INNER JOIN articles ON ligne_commande.id_article = articles.id_article
WHERE articles.nom = 'Calzone'
;

SELECT * FROM utilisateur
INNER JOIN commandes ON commandes.id_utilisateur = utilisateur.id_utilisateur
INNER JOIN commentaires ON commandes.id_commande = commentaires.id_commande
WHERE commentaires.note = '5'
;

SELECT * FROM commentaires
WHERE commentaires.note < 4
;

SELECT commandes.id_commande FROM commandes
INNER JOIN historique_statut_commande ON commandes.id_commande = historique_statut_commande.id_commande
INNER JOIN statut_commande ON historique_statut_commande.id_statut = statut_commande.id_statut
WHERE statut_commande.nom = 'Modifiée' OR statut_commande.nom = 'Annulée'
;

SELECT articles.nom FROM articles
INNER JOIN memos_recette ON articles.id_article = memos_recette.id_article
INNER JOIN stock_ingredients ON memos_recette.id_ingredient = stock_ingredients.id_ingredient
WHERE stock_ingredients.nom = 'jambon'
;

SELECT stock_ingredients.nom, memos_recette.quantite FROM memos_recette
INNER JOIN stock_ingredients ON stock_ingredients.id_ingredient = memos_recette.id_ingredient
INNER JOIN articles ON memos_recette.id_article = articles.id_article
WHERE articles.nom ='Gallina'
;
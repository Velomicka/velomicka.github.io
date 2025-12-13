
# Création de l'objet vdem 
vdem <- `V-Dem-CY-Full+Others-v15`

# Vérification si ça a marché
print("vdem créé avec succès!")


# Vérifier que v2mecenefi existe
"v2mecenefi" %in% names(vdem)

# Charger dplyr
library(dplyr)

# Filtrer France 2015-2023
france_data <- vdem %>%
  filter(country_name == "France", 
         year >= 2015, 
         year <= 2023) %>%
  select(year, country_name, v2mecenefi)

# Afficher le résultat
print(france_data)

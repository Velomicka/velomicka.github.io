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

# Installation de ggplot
install.packages("ggplot2")
library(ggplot2)

# Création du graphique
ggplot(france_data, aes(x = year, y = v2mecenefi)) +
  geom_line(color = "blue", size = 1.2) +
  geom_point(color = "red", size = 3) +
  labs(
    title = "Évolution de la surveillance Internet en France (2015-2023)",
    x = "Année",
    y = "Score de filtrage Internet (V-Dem)",
    caption = "Source : V-Dem Dataset v15"
  ) +
  theme_minimal() +
  scale_x_continuous(breaks = 2015:2023)

# Sauvegarde du graphique
ggsave("graphique_surveillance_france.png", width = 10, height = 6, dpi = 300)

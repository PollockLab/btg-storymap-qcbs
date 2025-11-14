# Script to extract some useful information from the champion grant form

# load libraries
library(tidyverse)

# import dataset
awards = read.csv("data/championteams_raw.csv")
inat = read.csv("data/observations-641750.csv/observations-641750.csv") 

# get the names of the awardees!
champions = c(awards$Nom.de.la.personne.qui.représente.l.équipe..Name.of.the.team.s.representative,
          awards$Noms.des.autre.membres.du.groupe..minimum.de.3.personnes.au.total..Names.of.other.group.members..minimum.3.people.total.) |>
  paste(collapse = ", ") |> 
  str_split(",") |> unlist() |> 
  str_squish() |> unique()
# 
# champions = champions |> 
#   str_split("&") |> 
#   str_split(" et ") |>
#   str_split(" and ")
  
# get user ids of the champions
user_logins = awards$Noms.d.utilisateur.iNaturalist.des.membres.du.groupe..iNaturalist.usernames.of.group.members..e.g..user1..user2..user3.  |>
  paste(collapse = ", ") |> 
  str_split(",") |> unlist() |> 
  str_squish() |> unique()


# clean up the user logins -----------------------------------------------------

# remove symbol @
user_logins = gsub("@", "", user_logins)
# remove content in parentheses
user_logins = gsub("\\s*\\([^\\)]+\\)", "", user_logins)
# remove strings that aren't user logins (manually)
user_logins = user_logins[-c(80:82,109)]

# save
saveRDS(user_logins, "data/championteams_userlogins.rds")


# subset the qcbs champions project to just these champions --------------------

inat.champs = inat |>
  filter(user_login %in% user_logins)
# save
saveRDS(inat.champs, "data/championteams_inat.rds")



## Summarise -------------------------------------------------------------------

# species found per user p
champs.sp = inat.champs |>
  group_by(user_login) |>
  distinct(taxon_species_name) |>
  summarise("n_sp" = n())
champs.sp = champs.sp[order(champs.sp$n_sp, decreasing = T),]
champs.sp$rank = 1:nrow(champs.sp)

# species found per user per taxa group
champs.sp.taxa = inat.champs |>
  group_by(user_login, iconic_taxon_name) |>
  distinct(taxon_species_name) |>
  summarise("n_sp" = n())
champs.sp.taxa$user_login = factor(champs.sp.taxa$user_login,
                                   levels = rev(champs.sp$user_login[champs.sp$rank]))
ggplot(data = champs.sp.taxa) +
  geom_bar(aes(x = user_login, y = n_sp, fill = iconic_taxon_name), 
           position = "stack", stat = "identity") +
  colorspace::scale_fill_discrete_qualitative() +
  coord_flip()


## top 10 for each group -------------------------------------------------------

# species found per user 
champs.sp = inat.champs |>
  group_by(user_login) |>
  distinct(taxon_species_name) |>
  summarise("n_sp" = n())
champs.sp = champs.sp[order(champs.sp$n_sp, decreasing = T),]
champs.sp$rank = 1:nrow(champs.sp)

# species found per user per taxa group
champs.sp.taxa = inat.champs |>
  group_by(user_login, iconic_taxon_name) |>
  distinct(taxon_species_name) |>
  summarise("n_sp" = n()) |>
  group_by(iconic_taxon_name) |> 
  group_split()
champs.sp.taxa[[1]][order(champs.sp.taxa[[1]]$n_sp)]
mutate("rank" = order(order(n_sp), decreasing = TRUE))
  
champs.sp.taxa$user_login = factor(champs.sp.taxa$user_login,
                                   levels = rev(champs.sp$user_login[champs.sp$rank]))
ggplot(data = champs.sp.taxa) +
  geom_bar(aes(x = user_login, y = n_sp, fill = iconic_taxon_name), 
           position = "stack", stat = "identity") +
  colorspace::scale_fill_discrete_qualitative() +
  coord_flip()

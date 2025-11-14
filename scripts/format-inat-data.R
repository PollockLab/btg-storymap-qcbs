# Script to format data from the QCBS Champion project
# downloaded manually from iNat.ca (all fields) on 10/11/2025

# load libraries
library(tidyverse)
library(terra)

# set ggplot theme
theme_set(hrbrthemes::theme_ipsum_rc())

# load canada base layers
basegrid = rast("data/base-layers/canada.base.5k.tiff") |>
  aggregate(factor = 20)
canpoly = vect("data/base-layers/canada-polygon/canada.outline.shp")
canpoly = project(canpoly, crs(basegrid))

# load csv from iNat project
df = read.csv("data/observations-641750.csv/observations-641750.csv")
coords = df |> select(latitude, longitude, iconic_taxon_name, scientific_name)

# make observation points layer
df_pts = vect(coords, geom = c("longitude", "latitude"), crs = "epsg:4326")
df_pts = project(df_pts, crs(basegrid))
saveRDS(df_pts, "layers/inat_points_all.csv")

# crop df_pts to Canada
df_pts = crop(df_pts, canpoly)

# density map of the observations
obsdens = rasterize(df_pts, basegrid, fun = 'length', by = 'iconic_taxon_name')
mapview::mapview(obsdens)
mapview::mapview(df_pts)

df_pts_sf = sf::st_as_sf(df_pts)
saveRDS(df_pts_sf, "layers/inat_points_all_sf.rds")

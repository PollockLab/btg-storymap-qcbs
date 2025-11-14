# Champion teams

hl_teams1 = function(){
  story_section(
      title = "1. Champion Team Observations",
      content = list(
        p(HTML("<i>Paradamoetas fontanus</i> was observed for the first time (and photographed beautifully!) this summer on iNaturalist. It is Imperiled in Canada (source: <a href = 'https://explorer.natureserve.org/Taxon/ELEMENT_GLOBAL.2.119580'>NatureServe</a>), so each observation is critical to inform conservation."))
    ),
    position = "center",
    width = 260, 
    bg_color = "white"
  )
}

# server

hl_teams1_server = function(){
  
  maplibre_proxy("map") |> 
    clear_markers() |>
    fly_to(center = c(-73, 46),
           zoom = 3,
           pitch = 0,
           bearing = 0) |>
    add_heatmap_layer(
      id = "team-obs",
      source = inat,
      heatmap_opacity = 0.5
    )
  
}
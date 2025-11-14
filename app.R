# Storymap of the Blitz the Gap highlight observations for the QCBS Champions project
# https://inaturalist.ca/projects/blitz-the-gap-qcbs-champions

# load libraries
library(shiny)
library(mapgl)

## Data loading ----------------------------------------------------------------


# Marker color
marker_col = "#79be6c" # from qcbs.ca buttons

# QCBS Champions iNaturalist points (sf format)
inat = readRDS("layers/inat_points_all_sf.rds") |> st_as_sf()

## Loading functions -----------------------------------------------------------

# The UI and servers for each section are stored in these function scripts:
source("sections/transitions.R")
source("sections/intro.R")
source("sections/hl_north.R")
source("sections/hl_greatshots.R")
source("sections/hl_ranges.R")
source("sections/hl_missingspecies.R")
source("sections/hl_kba.R")


## Access GBIF API for density map ---------------------------------------------

# use GBIF api for occurrence density maps
gbif_url <- "https://api.gbif.org/v2/map/occurrence/density/{z}/{x}/{y}@1x.png?style=blueHeat.point&datasetKey=50c9509d-22c7-4a22-a47d-8c48425ef4a7&country=CA&eventDate=2025-06-01,2025-09-31"
# {z},{x},{y}: placeholders for the tile coordinates
# datasetKey: iNaturalist
# eventDate: date range (to update)
# country: Canada (CA)
# styles: https://api.gbif.org/v2/map/styles.html


## USER INTERFACE --------------------------------------------------------------

ui <- fluidPage(
  story_map(
    
    # Base map -----------------------------------------------------------------
    map_id = "map",
    font_family = "Public Sans",
    map_type = "maplibre",
    
    sections = list(
      
      # Introduction -----------------------------------------------------------
      
      "intro1" = intro1(),
      "intro2" = intro2(),
      
      # QCBS Champion teams ----------------------------------------------------
      "section_teams" = transition_to_teams(),
      "hl_teams1" = hl_teams1(), 
      
      # # Northern biodiversity highlights ---------------------------------------
      # 
      # "section_north" = transition_to_north(),
      # "hl_north1" = hl_north1_ui(),
      # "hl_north2" = hl_north2_ui(),
      # "hl_north5" = hl_north5_ui(),
      # "hl_north4" = hl_north4_ui(),
      # "hl_north3" = hl_north3_ui(),
      # "hl_north3_photo1" = hl_north3_photo1_ui(),
      # "hl_north3_photo2" = hl_north3_photo2_ui(),
      # "hl_north3_photo3" = hl_north3_photo3_ui(),
      
      # # Range extremes ---------------------------------------------------------
      # 
      # "section_ranges" = transition_to_ranges(),
      # "hl_range1" = hl_range1_ui(),
      # "hl_range2" = hl_range2_ui(),
      # "hl_range3" = hl_range3_ui(),
      # 
      # # Missing species --------------------------------------------------------
      # 
      # "section_missingspecies" = transition_to_missingspecies(),
      # "hl_missing1" = hl_missing1_ui(),
      # "hl_missing2" = hl_missing2_ui(),
      # "hl_missing3" = hl_missing3_ui(),
      
      # Key Biodiversity Areas for conservation --------------------------------
      
      # "section_kba" = transition_to_kba(),
      # "hl_kba1" = hl_kba1_ui(),
      # "hl_kba2" = hl_kba2_ui(),
      # "hl_kba3" = hl_kba3_ui(),
      
      # Great shots ------------------------------------------------------------
      
      "section_shots" = transition_to_greatshots(),
      "hl_shot1" = hl_shot1_ui(),
      "hl_shot2" = hl_shot2_ui(),
      "hl_shot3" = hl_shot3_ui(),
      "hl_shot4" = hl_shot4_ui(),
      "hl_shot5" = hl_shot5_ui(),
      "hl_shot6" = hl_shot6_ui(),
      "hl_shot7" = hl_shot7_ui(),
      "hl_shot8" = hl_shot8_ui(),
      
      # End: Thank you ---------------------------------------------------------
      
      "thankyou" = story_section(
        title = "Thank you!",
        content = list(
          img(src = "https://github.com/PollockLab/blitz-the-gap/blob/master/images/Logo2.png?raw=true",
              width = "350px", position = "center"),
          p("Thank you for Blitzing the Gap in Canadian biodiversity data this summer. There are still many gaps to fill, but we've been amazed to see the progress that can be made in one summer, thanks to the passionate community on iNaturalist.ca."),
          p(HTML("Stay tuned, we'll keep updating this highlights reel with more results as we analyze all the amazing observations you've made this summer! Visit <a href ='https://blitzthegap.org/'>blitzthegap.org</a> for more information."))),
        position = "center")
    )
  )
)


# SERVER # ---------------------------------------------------------------------

server <- function(input, output, session) {
  
  # Base map -------------------------------------------------------------------
  output$map <- renderMaplibre({
    
    maplibre(
      maptiler_style("satellite"),   # base map style
      scrollZoom = FALSE,       # block scroll zooming otherwise you can't move
      center = c(-101, 62),     # center-ish of Canada
      zoom = 1.6) |>
      
      # set to globe for the sphere look
      set_projection("globe") |> 
      
      # Add the GBIF raster tile layer
      mapgl::add_raster_source(
        id = "inat-density-summer2025",
        tiles = gbif_url 
      ) |>
      # Add the raster layer to the map
      mapgl::add_raster_layer(
        id = "gbif-layer",
        source = "inat-density-summer2025",
        raster_opacity = 0.8)
  })
  
  # Introduction ---------------------------------------------------------------
  
  # set the zoom and center of the base map
  on_section("map", "intro1", {
    maplibre_proxy("map") })
  
  on_section("map", "intro2", {
    maplibre_proxy("map") })
  
  on_section("map", "transition_to_teams", {
    maplibre_proxy("map") |> 
      fly_to(center = c(-80, 65),
             pitch = 0,
             bearing = 0)
  })
  
  # Teams
  on_section("map", "hl_teams1", {
    hl_teams1_server()})
  
  # Northern biodiversity highlight
  on_section("map", "hl_north1", {
    hl_north1_server()})
  on_section("map", "hl_north2", {
    hl_north2_server()})
  on_section("map", "hl_north5", {
    hl_north5_server()})
  on_section("map", "hl_north4", {
    hl_north4_server()})
  
  # Subsection: Fiord expedition
  on_section("map", "hl_north3", {
    hl_north3_server()})
  on_section("map", "hl_north3_photo1", {
    hl_north3_photo1_server()})
  on_section("map", "hl_north3_photo2", {
    hl_north3_photo2_server()})
  on_section("map", "hl_north3_photo3", {
    hl_north3_photo3_server()})
  
  on_section("map", "section_shots", {
    maplibre_proxy("map") |> 
      # clear the heatmap and circle layers
      clear_layer("bioblitz") |>
      clear_layer("bioblitz2") |>
      # fly to new location!
      fly_to(center = c(-101, 63),
             zoom = 2,
             pitch = 0,
             bearing = 0)
  })
  
  # Range extremes -----------------------------------------------------------------
  
  on_section("map", "section_ranges", {
    maplibre_proxy("map") |> 
      fly_to(center = c(-101, 63),
             zoom = 2,
             pitch = 0,
             bearing = 0) })
  
  on_section("map", "hl_range1", {
    hl_range1_server() })
  
  on_section("map", "hl_range2", {
    hl_range2_server() })
  
  on_section("map", "hl_range3", {
    hl_range3_server() })
  
  # Missing species ------------------------------------------------------------
  
  on_section("map", "transition_to_missingspecies", {
    maplibre_proxy("map") |> 
      fly_to(center = c(-101, 63),
             zoom = 2,
             pitch = 0,
             bearing = 0)
  })
  
  on_section("map", "hl_missing1", {
    hl_missing1_server() })
  
  on_section("map", "hl_missing2", {
    hl_missing2_server() })
  
  on_section("map", "hl_missing3", {
    hl_missing3_server() })
  
  
  # Key Biodiversity Areas for conservation --------------------------------
  
  on_section("map", "transition_to_kba", {
    maplibre_proxy("map") |> 
      clear_markers() |>
      fly_to(center = c(-101, 63),
             zoom = 2,
             pitch = 0,
             bearing = 0)
  })
  
  on_section("map", "hl_kba1", {
    hl_kba1_server() })
  
  on_section("map", "hl_kba2", {
    hl_kba2_server() })
  
  on_section("map", "hl_kba3", {
    hl_kba3_server() })
  
  
  # Great shots ----------------------------------------------------------------
  
  on_section("map", "hl_shot1", {
    hl_shot1_server()})
  on_section("map", "hl_shot2", {
    hl_shot2_server()})
  on_section("map", "hl_shot3", {
    hl_shot3_server()})
  on_section("map", "hl_shot4", {
    hl_shot4_server()})
  on_section("map", "hl_shot5", {
    hl_shot5_server()})
  on_section("map", "hl_shot6", {
    hl_shot6_server()})
  on_section("map", "hl_shot7", {
    hl_shot7_server()})
  on_section("map", "hl_shot8", {
    hl_shot8_server()})
  
  # End: Thank you -------------------------------------------------------------
  on_section("map", "thankyou", {
    maplibre_proxy("map") |>
      clear_markers() |>
      fly_to(center = c(-101, 62),
             zoom = 2,
             pitch = 0,
             bearing = 0)})
}

shinyApp(ui, server)
# Great photos

## Bicolored Striped Sweat Bee -----------------------------------------------------

# ui
hl_shot1_ui = function(){
  "hl_shot1" = story_section(
    title = "Bicolored Striped Sweat Bee",
    content = list(
      p(HTML("This shot by André-Philippe Drapeau Picard (<a href = 'https://inaturalist.ca/people/apdp'>@apdp</a>) of the Bicolored Striped Sweat Bee (<i>Agapostemon virescens</i>).")),
        img(src = "https://inaturalist-open-data.s3.amazonaws.com/photos/536823163/large.jpg", 
            width = "350px"),
        p(HTML("© André-Philippe Drapeau Picard (<a href = 'https://inaturalist.ca/people/apdp'>@apdp/a>), some rights reserved (CC-BY-NC) | <a href = 'https://inaturalist.ca/observations/298049157'>View observation</a>"))
  )
  )
}

# server

hl_shot1_server = function(){
  
  maplibre_proxy("map") |> 
    clear_markers() |>
    fly_to(center = c(-73.5574770068, 45.5610312937), 
           zoom = 6,
           pitch = 49,
           bearing = 12.8) |> 
    add_markers(
      c(-73.5574770068, 45.5610312937),
      color = marker_col,
      rotation = 0,
      popup = "Bicolored Striped Sweat Bee"
    )
}





## Interactions!! --------------------------------------------------------------

# ui
hl_shot2_ui = function(){
  "hl_shot2" = story_section(
    title = "Luna moth",
    content = list(
      p(
        img(src = "https://inaturalist-open-data.s3.amazonaws.com/photos/522490440/large.jpg", 
            width = "350px"),
        p(HTML("© Amanda Gregoire (<a href = 'https://inaturalist.ca/people/amagregz'>@amagregz</a>), some rights reserved (CC-BY-NC) | <a href = 'https://inaturalist.ca/observations/290443802'>View observation</a>"))
        )
  ))
}

# server

hl_shot2_server = function(){
  
  maplibre_proxy("map") |> 
    clear_markers() |>
    fly_to(center = c(-68.0272156745, 47.3282318938), 
           zoom = 8,
           pitch = 49,
           bearing = 12.8) |> 
    add_markers(
      c(-68.0272156745, 47.3282318938),
      color = marker_col,
      rotation = 0
    )
}

## Beautiful & rare insect --------------------------------------------------------------

# ui
hl_shot3_ui = function(){
  "hl_shot3" = story_section(
    title = "Peekaboo!",
    content = list(
      p(HTML("This is a Common Tiger Beetle (Genus <i>Cicindela</i>) peeking out of a hole in the ground. This shot was captured by Justin Chans from the BC Parks Biodiversity team as part of the <a href='https://inaturalist.ca/projects/32265'>BC Parks</a> project!")),
        img(src = "https://inaturalist-open-data.s3.amazonaws.com/photos/563763935/large.jpg", 
            width = "350px"),
        p(HTML("© Justin Chan (<a href = 'https://inaturalist.ca/people/justinchans'>@justinchans</a>), some rights reserved (CC-BY-NC) | <a href = 'https://inaturalist.ca/observations/312262774'>View observation</a>"))
    )
  )
}

# server

hl_shot3_server = function(){
  
  maplibre_proxy("map") |> 
    clear_markers() |>
    fly_to(center = c(-122.01620, 49.17427), 
           zoom = 8,
           pitch = 49,
           bearing = 12.8) |> 
    add_markers(
      c(-122.01620, 49.17427),
      color = marker_col,
      rotation = 0
    )
}

## Bobcat --------------------------------------------------------------

# ui
hl_shot4_ui = function(){
  "hl_shot4" = story_section(
    title = "Eye contact!",
    content = list(
      p(HTML("A Bobcat (<i>Lynx rufus</i>) sighting in Burnaby Lake Regional Park, British Columbia.")),
      img(src = "https://inaturalist-open-data.s3.amazonaws.com/photos/571256998/large.jpg", 
          width = "350px"),
      p(HTML("© Derek Moore (<a href = 'https://inaturalist.ca/people/derekinthemud'>@derekinthemud</a>), some rights reserved (CC-BY-NC) | <a href = 'https://inaturalist.ca/observations/316193215'>View observation</a>"))
    )
  )
}

# server

hl_shot4_server = function(){
  
  maplibre_proxy("map") |> 
    clear_markers() |>
    fly_to(center = c(-122.92046, 49.24261), 
           zoom = 10,
           pitch = 49,
           bearing = 12.8) |> 
    add_markers(
      c(-122.92046, 49.24261),
      color = marker_col,
      rotation = 0
    )
}

## Mountain goat --------------------------------------------------------------

# ui
hl_shot5_ui = function(){
  "hl_shot5" = story_section(
    title = "Sleepy snooze!",
    content = list(
      p(HTML("A Mountain Goat (<i>Oreamnos americanus</i>) enjoying the view on a sunny hillside near Calgary. This location is approximate, as the coordinates are obscured by default to protect this species.")),
      img(src = "https://inaturalist-open-data.s3.amazonaws.com/photos/535978741/large.jpg", 
          width = "350px"),
      p(HTML("© <a href = 'https://inaturalist.ca/people/trent306'>@trent306</a>, some rights reserved (CC-BY-NC) | <a href = 'https://inaturalist.ca/observations/297603290'>View observation</a>"))
    )
  )
}

# server

hl_shot5_server = function(){
  
  maplibre_proxy("map") |> 
    clear_markers() |>
    fly_to(center = c(-114.83258, 50.93375), 
           zoom = 8,
           pitch = 49,
           bearing = 12.8) |> 
    add_markers(
      c(-114.83258, 50.93375),
      color = marker_col,
      rotation = 0
    )
}



## Orange Sulphur --------------------------------------------------------------

# ui
hl_shot6_ui = function(){
  "hl_shot6" = story_section(
    title = "Beautiful colours!",
    content = list(
      p(HTML("The Orange Sulphur (<i>Colias eurytheme</i>) stands out beautifully thanks to its bright colour!")),
      img(src = "https://static.inaturalist.org/photos/567333537/large.jpg", 
          width = "350px"),
      p(HTML("© Griffin Lepage (<a href = 'https://inaturalist.ca/people/griffin_l'>@griffin_l</a>), some rights reserved (CC-BY-NC) | <a href = 'https://inaturalist.ca/observations/314123623'>View observation</a>"))
    )
  )
}

# server

hl_shot6_server = function(){
  
  maplibre_proxy("map") |> 
    clear_markers() |>
    fly_to(center = c(-77.73291, 43.98889), 
           zoom = 8,
           pitch = 49,
           bearing = 12.8) |> 
    add_markers(
      c(-77.73291, 43.98889),
      color = marker_col,
      rotation = 0
    )
}

## northern leopard frog --------------------------------------------------------------

# ui
hl_shot6_ui = function(){
  "hl_shot6" = story_section(
    title = "Sitting pretty",
    content = list(
      p(HTML("The Northern Leopard Frog (<i>Lithobates pipiens</i>) showing off its spots in Swaines Bog, Barrington, Nova Scotia, Canada.")),
      img(src = "https://inaturalist-open-data.s3.amazonaws.com/photos/551211423/large.jpg", 
          width = "350px"),
      p(HTML("© John D Reynolds (<a href = 'https://inaturalist.ca/people/johndreynolds'>@johndreynolds</a>), some rights reserved (CC-BY-NC) | <a href = 'https://inaturalist.ca/observations/305699828'>View observation</a>"))
    )
  )
}

# server

hl_shot6_server = function(){
  
  maplibre_proxy("map") |> 
    clear_markers() |>
    fly_to(center = c(-65.51392,  43.57974), 
           zoom = 12,
           pitch = 49,
           bearing = 12.8) |> 
    add_markers(
      c(-65.51392,  43.57974),
      color = marker_col,
      rotation = 0
    )
}


## woodpecker --------------------------------------------------------------

# ui
hl_shot7_ui = function(){
  "hl_shot6" = story_section(
    title = "Anybody home?",
    content = list(
      p(HTML("A Pileated Woodpecker (<i>Dryocopus pileatus</i>) keeping an eye out for visitors in Canmore, Alberta.")),
      img(src = "https://inaturalist-open-data.s3.amazonaws.com/photos/516851849/large.jpg", 
          width = "350px"),
      p(HTML("© Chris Fisher (<a href = 'https://inaturalist.ca/people/ccfisher'>@ccfisher</a>), some rights reserved (CC-BY-NC) | <a href = 'https://inaturalist.ca/observations/287448096'>View observation</a>"))
    )
  )
}

# server

hl_shot7_server = function(){
  
  maplibre_proxy("map") |> 
    clear_markers() |>
    fly_to(center = c(-115.36490,51.07809), 
           zoom = 12,
           pitch = 49,
           bearing = 12.8) |> 
    add_markers(
      c(-115.36490,51.07809),
      color = marker_col,
      rotation = 0
    )
}


## bobtail --------------------------------------------------------------

# ui
hl_shot7_ui = function(){
  "hl_shot7" = story_section(
    title = "Under the sea",
    content = list(
      p(HTML("A glittery Stubby Bobtail (<i>Rossia pacifica</i>) in Lions Bay, British Columbia.")),
      img(src = "https://inaturalist-open-data.s3.amazonaws.com/photos/522304495/large.jpg", 
          width = "350px"),
      p(HTML("© <a href = 'https://inaturalist.ca/people/hewittdoesit'>@hewittdoesit</a>), some rights reserved (CC-BY-NC) | <a href = 'https://inaturalist.ca/observations/290342520'>View observation</a>"))
    )
  )
}

# server

hl_shot7_server = function(){
  
  maplibre_proxy("map") |> 
    clear_markers() |>
    fly_to(center = c(-123.24034,49.44981), 
           zoom = 12,
           pitch = 49,
           bearing = 12.8) |> 
    add_markers(
      c(-123.24034,49.44981),
      color = marker_col,
      rotation = 0
    )
}

## sea otter --------------------------------------------------------------

# ui
hl_shot8_ui = function(){
  "hl_shot8" = story_section(
    title = "Otter-ly great shot!",
    content = list(
      p(HTML("A Northern Sea Otter (<i>Enhydra lutris ssp. kenyoni</i>) in Coastal British Columbia.")),
      img(src = "https://static.inaturalist.org/photos/542516431/large.jpg", 
          width = "350px"),
      p(HTML("© Newt McLean (<a href = 'https://inaturalist.ca/people/ugly_eye_man'>@ugly_eye_man</a>), some rights reserved (CC-BY-NC) | <a href = 'https://inaturalist.ca/observations/301075889'>View observation</a>"))
    )
  )
}

# server

hl_shot8_server = function(){
  
  maplibre_proxy("map") |> 
    clear_markers() |>
    fly_to(center = c(-125.94609,49.13271), 
           zoom = 15,
           pitch = 49,
           bearing = 12.8) |> 
    add_markers(
      c(-125.94609,49.13271),
      color = marker_col,
      rotation = 0
    )
}
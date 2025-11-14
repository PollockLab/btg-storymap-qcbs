# Section transitions

transition_to_teams = function(){
  story_section(
    title = "QCBS Champions",
    content = list(
      p("This summer, 24 student-led teams received QCBS Champion Grants to plan a bioblitz or field trip to Blitz the Gap.")
    ),
    position = "center",
    width = 600,
    bg_color = "white"
  )
}

transition_to_north = function(){
  story_section(
    title = "1. Northern biodiversity",
    content = list(
      p("This summer, we saw some very cool observations from the North! These observations are incredibly valuable to understand and track biodiversity changes in Arctic ecosystems, which are particularly vulnerable to climate change.")
    ),
    position = "center",
    width = 600,
    bg_color = "white"
  )
}

transition_to_ranges = function(){
  story_section(
    title = "2. Species on the move",
    content = list(
      p("We had some surprises this summer! You saw some species outside of their known range limits. These observations are very important to track new species' arrivals as well as species' range shifts.")
    ),
    position = "center",
    width = 600,
    bg_color = "white"
  )
}


transition_to_missingspecies = function(){
  story_section(
    title = "3. Lost and found",
    content = list(
      p(HTML("iNaturalist Canada <a href = 'https://www.inaturalist.org/blog/108240-dashboard'>asked for your help to find missing species in Canada</a>, and you delivered! Over 170 missing species were observed on iNaturalist.ca this summer. This number is likely to keep going up as your identifications roll in to validate these new sightings! Here are some noteworthy finds!"))
    ),
    position = "center",
    width = 600,
    bg_color = "white"
  )
}

transition_to_kba = function(){
  story_section(
    title = "4. Key Biodiversity Areas for conservation!",
    content = list(
      p(HTML("The <a href ='https://kbacanada.org/'>KBA Canada</a> team at <a href ='https://wcscanada.org/'>WCS Canada</a> asked you to help find high-priority species the might lead to the recognition of new KBAs, and to visit some of the “MayBAs” - sites that seem likely to be Key Biodiversity Areas but require more sampling or certain taxa within them (See the <a href = 'https://inaturalist.ca/projects/blitz-the-gap-conservation-priorities-in-canada-maybas'>Challenge</a>). Community scientists across the country delivered on this spectacularly! These new observations will help lead to new KBAs, which will inform conservation planning and decision-making across the country.")),
      img(src = "https://kbacanada.org/wp-content/themes/kbatheme/assets/img/home/KBA_Canada_Dark_Logo.png", 
          width = "350px", position = "center")
    ),
    position = "center",
    width = 420,
    bg_color = "white"
  )
}

transition_to_greatshots = function(){
  story_section(
    title = "5. Great shots!",
    content = list(
      p("Beyond this valuable data, you took great photos of Canadian biodiversity this summer. Here are some of our favourites!")
    ),
    position = "center",
    width = 600,
    bg_color = "white"
  )
}





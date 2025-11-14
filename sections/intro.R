# Introduction sections

intro1 = function(){
  story_section(
    title = "",
    content = list(
      img(src = "https://github.com/PollockLab/blitz-the-gap/blob/master/images/Logo2.png?raw=true",
          width = "240px"),
      img(src = "https://qcbs.ca/wp-content/uploads/2018/09/qcbs_logo_v2.png",
                              width = "240px")),
    position = "center",
    width = 260, 
    bg_color = "white"
  )
}

intro2 = function(){
  story_section(
    title = "This summer, we asked the Québec Centre for Biodiversity Science (QCBS) to Blitz the Gap in Canadian biodiversity data.",
    content = list(
      img(src = "https://qcbs.ca/wp-content/uploads/2018/09/qcbs_logo_v2.png",
          width = "550px"),
      p(HTML("Since June 1st, 2025, 76 members contributed <b>over 28,000 observations</b> of more than 4,400 species (and counting!) to iNaturalist Canada! Here are some of the highlights."))
    ),
    position = "center",
    width = 600,
    bg_color = "white"
  )
}

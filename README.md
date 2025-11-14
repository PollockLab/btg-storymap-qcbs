# Storymap: Blitz the Gap QCBS Highlights

Storymap to show some of the highlights of the Blitz the Gap 2025 observations from the Québec Centre for Biodiversity Science project ([inaturalist.ca/projects/blitz-the-gap-qcbs-champions](https://inaturalist.ca/projects/blitz-the-gap-qcbs-champions)). 

## App structure

This storymap is a Shiny app created with the package [`mapgl`](https://walker-data.com/mapgl/articles/story-maps.html). 

The base map is from Maplibre, with the "satellite" style and "globe" projection.

The density map displayed on the globe draws from GBIF's occurence density map API, filtering for observations from the iNaturalist research-grade dataset in Canada from June 1 2025 to September 30 2025. This is coded in `app.R`.

The app's user interface (UI) and server are in `app.R`. 

The app is structured in several sections, stored in the `sections` folder. Each section contains a series of featured observations, which are each encoded as a user interface and server function. These sections are:
- Introduction (`intro.R`)
- Champion teams (`hl_teams.R`)
- Great shots (`hl_greatshots.R`)
- The Thank You section is written directly in the UI (`app.R`)

Transition text between sections are written in: `transitions.R`.

All displayed photos are hosted on iNaturalist.ca, and displayed using their web address (i.e., they are not hosted locally by the app). All credits for these photos are written in the app.

## Deployment

- Run `deploy.R` to deploy the app to the blitzthegap.shinyapps.io account (not yet ready!)

module Pages.About exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Model exposing (..)
import Update exposing (..)

page : Model.Model -> Html Update.Msg
page model =
  div
    [ class "GridContainer"]
    [
      div [class "MarginBox"][]
      , div
        [class "PageBox"]
        [
          div
            [class "FlexColumn"]
            [
              div [class "Flex1"][]
              , div
                [class "Flex1"]
                [
                  div
                  [class "PageTitle greenBack blackColor"]
                  [
                    p[][text "Welcome to My First Elm Project"]
                  ]
                ]
              , div
                [class "Flex1"]
                [
                  div
                  [class "PageHeading greenBack blackColor"]
                  [
                    p[][text "What this is all About"]
                  ]
                  , div
                  [class "PageText blackBack whiteColor"
                  ,style[("line-height", "150%"),("font-size", "20px")]]
                  [
                    p[][text "In an approximately one week period I have attempted to learn as much as I could about the Elm framework - to the extent that I could make a working app based on examples in the documentation and perhaps go a little bit farther. The purpose of this app is not to be *astounding* or a place to stop, but a beginning."]
                  ]
                ]
              , div
                [class "Flex1"]
                [
                  div
                  [class "PageHeading greenBack blackColor"]
                  [
                    p[][text "Post Mortem"]
                  ]
                  ,  div
                  [class "PageText blackBack whiteColor"
                  ,style[("line-height", "150%")]]
                  [
                    p[][text "Having completed the project there were a few take aways on things that could be or could have been improved that I think it is important to note for the future. Many, but not all, of these issues were due to the time constraints preventing them from being MVP."]
                    ,ul [class "ulStyling"]
                    [ li [] [text "In the backend, the web socket scheduler was not included in a route but put in the main app. Many different socket libraries were used, but I was constrained in my choices as I was piping to Elm."]
                    , li [] [text "The main navigation was handled in Elm, but would be handled more eloquently in the top level if I were to start over. This decision was forced on me by deciding to do JS porting after I had architected my navigation and it was too late to change."]
                    , li [] [text "I very much would have liked to make a Kubernetes deployment, but I was constrained by time considerations and lack of experience. I found that while deploying the backend and frontend to different pods on Kubernetes was trivial getting those pods to communicate without reverse proxies or unfamiliar libraries was not. Under other circumstances with more time it would be interesting to revisit - the azure-deploy yaml files are in the root of the project directory simply for future reference."]
                    , li [] [text "UI styling is functional but minimal. As part of learning the new syntax I did not have the time to go through the project and make it as pretty as I would have liked. I also would like to have a better understanding of how css files are handled as imports in Elm rather than being imported in the containing index.html file."]
                    ]
                  ]
                ]
              , div
                [class "Flex1"]
                [
                  div
                  [class "PageHeading greenBack blackColor"]
                  [
                    p[][text "Features"]
                  ]
                  , div
                  [class "PageSubHeading greenBack blackColor"]
                  [
                    p[][text "Elm & Vue"]
                  ]
                  , div
                  [class "PageText blackBack whiteColor"]
                  [
                      ul [class "ulStyling"]
                      [ li [] [text "Well architected starter project with Elm components in separate files. Specifically individual pages have their own files in a pages directory, while Main, Model, and Update are broken up into files. Model is top level with Main and Update acting as children (no looping references)."]
                      , li [] [text "Learned the syntax for Elm 'jsx'."]
                      , li [] [text "Page handling done through a pageHandler function in the Main file. While not a complete SPA (single page application), it can appear to be as one."]
                      , li [] [text "An example calling the backend for a get request and updating the UI with the values."]
                      , li [] [text "Similarly a socket based request is opened to the backend using the subscriptions method to get real time streaming of events."]
                      , li [] [text "Finally, ports are opened to a Vue app which the Elm application is embedded into. Subscriptions are used to call a function and return from there."]
                      , li [] [text "Usage of functions throughout and understanding of typing."]
                      , li [] [text "Json Decoding using NoRedInk Pipeline method"]
                      ]
                  ]
                  , div
                  [class "PageSubHeading greenBack blackColor"]
                  [
                    p[][text "Backend"]
                  ]
                  , div
                  [class "PageText blackBack whiteColor"]
                  [
                      ul [class ""]
                      [ li [] [text "Scaffolded express app."]
                      , li [] [text "Routing for get request for weather call, calling third party api to get the current weather of an inputted city."]
                      , li [] [text "Web sockets implementation using the ws package."]
                      , li [] [text "cron scheduler app that listens to update a story that is retrieved from the Wired news feed."]
                      , li [] [text "XML parser converts to JSON."]
                      ]
                  ]
                  , div
                  [class "PageSubHeading greenBack blackColor"]
                  [
                    p[][text "CSS"]
                  ]
                  , div
                  [class "PageText blackBack whiteColor"]
                  [
                      ul [class "ulStyling"]
                      [ li [] [text "CSS grid is used for the main 'gross' styling of the app including the location of the header and body of the Elm SPA."]
                      , li [] [text "Use of Flexbox column and row throughout for minor adjustments."]
                      , li [] [text "Global stylesheet included in index.html file."]
                      ]
                  ]
                  , div
                  [class "PageSubHeading greenBack blackColor"]
                  [
                    p[][text "Deployment"]
                  ]
                  , div
                  [class "PageText blackBack whiteColor"]
                  [
                      ul [class "ulStyling"]
                      [ li [] [text "Dockerized front and back end, packaged together in docker-compose file."]
                      , li [] [text "Deployed to Azure (availability of free credits), in VM. Necessity to send files to machine, ssh in and spin up. Also necessary to create Security Group to open ports and attach to subnet."]
                      ]
                  ]
                ]
            ]
        ]
    ]

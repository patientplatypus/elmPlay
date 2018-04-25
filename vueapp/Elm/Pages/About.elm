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
                  [class "PageText blackBack whiteColor"]
                  [
                    p[][text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."]
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
                    p[][text "Elm"]
                  ]
                  , div
                  [class "PageText blackBack whiteColor"]
                  [
                      ul [class ""]
                      [ li [] [text "Pamplemousse"]
                      , li [] [text "Ananas"]
                      , li [] [text "Jus d'orange"]
                      , li [] [text "Boeuf"]
                      , li [] [text "Soupe du jour"]
                      , li [] [text "Camembert"]
                      , li [] [text "Jacques Cousteau"]
                      , li [] [text "Baguette"]
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
                      ul [class ""]
                      [ li [] [text "Pamplemousse"]
                      , li [] [text "Ananas"]
                      , li [] [text "Jus d'orange"]
                      , li [] [text "Boeuf"]
                      , li [] [text "Soupe du jour"]
                      , li [] [text "Camembert"]
                      , li [] [text "Jacques Cousteau"]
                      , li [] [text "Baguette"]
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
                      ul [class ""]
                      [ li [] [text "Pamplemousse"]
                      , li [] [text "Ananas"]
                      , li [] [text "Jus d'orange"]
                      , li [] [text "Boeuf"]
                      , li [] [text "Soupe du jour"]
                      , li [] [text "Camembert"]
                      , li [] [text "Jacques Cousteau"]
                      , li [] [text "Baguette"]
                      ]
                  ]
                  , div
                  [class "PageSubHeading greenBack blackColor"]
                  [
                    p[][text "Cloud"]
                  ]
                  , div
                  [class "PageText blackBack whiteColor"]
                  [
                      ul [class ""]
                      [ li [] [text "Pamplemousse"]
                      , li [] [text "Ananas"]
                      , li [] [text "Jus d'orange"]
                      , li [] [text "Boeuf"]
                      , li [] [text "Soupe du jour"]
                      , li [] [text "Camembert"]
                      , li [] [text "Jacques Cousteau"]
                      , li [] [text "Baguette"]
                      ]
                  ]
                ]
            ]
        ]
    ]

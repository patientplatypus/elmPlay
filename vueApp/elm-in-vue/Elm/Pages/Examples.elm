module Pages.Examples exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Model exposing (..)
import Update exposing (..)

import Json.Decode as Decode

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
                  [class "PageTitle redBack blackColor"]
                  [
                    p[][text "Examples Page"]
                  ]
                ]
              , div
                [class "Flex1"]
                [
                  div
                  [class "PageHeading redBack blackColor"]
                  [
                    p[][text "Http Requests"]
                  ]
                  ,div
                  [class "PageText blackBack whiteColor"
                  , style[("position", "relative")]]
                  [
                    div
                    [class "FlexRow"]
                    [
                      div
                      [class "Flex2"]
                      [
                        div
                        [class "blueBack whiteColor"
                        , style[("height", "15vh"), ("color", "white"), ("padding", "1vh"), ("borderRadius", "25px")]]
                        [
                          div
                          [style[("width", "10vw")]]
                          [
                            button [ style[("width", "100%")], onClick GetWeather ] [ text "Get Current Weather" ]
                          ]
                          ,div
                          [style[("width", "10vw")]]
                          [
                            input [ style[("width", "100%")], placeholder "Get weather for what city?", onInput PickCity ][]
                          ]
                        ]
                      ]
                      , div [class "Flex1"][]
                      , div
                      [class "Flex4"]
                      [
                        div
                        [class "blueBack whiteColor"
                        , style[("height", "15vh"), ("line-height", "4px"), ("font-size", "12px") ,("color", "white"), ("padding", "1vh"), ("borderRadius", "25px")]]
                        [
                          div
                          [class "FlexRow"
                          , style[("paddingBottom", "0.25vh")]]
                          [
                            div
                            [class "Flex1"]
                            [
                              div
                              [ class "greenBack blackColor"
                              , style[("height", "2.5vh"), ("width", "5vw"), ("textAlign", "center"), ("padding", "0.1%"),("line-height", "0px"), ("borderRadius", "10px"), ("fontWeight", "bold"), ("font-size", "12px"), ("display", "inline-block")]]
                              [
                                p[][text "location"]
                              ]
                            ]
                            ,div
                            [class "Flex1"][]
                            ,div
                            [class "Flex10"]
                            [
                              div
                              [style[("line-height", "0px"), ("margin", "0"), ("padding", "0")]]
                              [
                                p[][text (model.currentWeather.place)]
                              ]
                            ]
                          ]
                          , div
                          [class "FlexRow"
                          , style[("paddingBottom", "0.25vh")]]
                          [
                            div
                            [class "Flex1"]
                            [
                              div
                              [ class "greenBack blackColor"
                              , style[("height", "2.5vh"), ("width", "5vw"), ("textAlign", "center"), ("padding", "0.1%"),("line-height", "0px"), ("borderRadius", "10px"), ("fontWeight", "bold"), ("font-size", "12px"), ("display", "inline-block")]]
                              [
                                p[][text "description"]
                              ]
                            ]
                            ,div
                            [class "Flex1"][]
                            ,div
                            [class "Flex10"]
                            [
                              div
                              [style[("line-height", "0px"), ("margin", "0"), ("padding", "0")]]
                              [
                                p[][text (model.currentWeather.description)]
                              ]
                            ]
                          ]
                          ,div
                          [class "FlexRow"
                          , style[("paddingBottom", "0.25vh")]]
                          [
                            div
                            [class "Flex1"]
                            [
                              div
                              [ class "greenBack blackColor"
                              , style[("height", "2.5vh"), ("width", "5vw"), ("textAlign", "center"), ("padding", "0.1%"),("line-height", "0px"), ("borderRadius", "10px"), ("fontWeight", "bold"), ("font-size", "12px"), ("display", "inline-block")]]
                              [
                                p[][text "temperature"]
                              ]
                            ]
                            ,div
                            [class "Flex1"][]
                            ,div
                            [class "Flex10"]
                            [
                              div
                              [style[("line-height", "0px"), ("margin", "0"), ("padding", "0")]]
                              [
                                p[][text (model.currentWeather.temp++" in degrees Celcius")]
                              ]
                            ]
                          ]
                          ,div
                          [class "FlexRow"
                          , style[("paddingBottom", "0.25vh")]]
                          [
                            div
                            [class "Flex1"]
                            [
                              div
                              [ class "greenBack blackColor"
                              , style[("height", "2.5vh"), ("width", "5vw"), ("textAlign", "center"), ("padding", "0.1%"),("line-height", "0px"), ("borderRadius", "10px"), ("fontWeight", "bold"), ("font-size", "12px"), ("display", "inline-block")]]
                              [
                                p[][text "humidity"]
                              ]
                            ]
                            ,div
                            [class "Flex1"][]
                            ,div
                            [class "Flex10"]
                            [
                              div
                              [style[("line-height", "0px"), ("margin", "0"), ("padding", "0")]]
                              [
                                p[][text (model.currentWeather.humidity++"%")]
                              ]
                            ]
                          ]
                          ,div
                          [class "FlexRow"]
                          [
                            div
                            [class "Flex1"]
                            [
                              div
                              [ class "greenBack blackColor"
                              , style[("height", "2.5vh"), ("width", "5vw"), ("textAlign", "center"), ("padding", "0.1%"),("line-height", "0px"), ("borderRadius", "10px"), ("fontWeight", "bold"), ("font-size", "12px"), ("display", "inline-block")]]
                              [
                                p[][text "precipiation"]
                              ]
                            ]
                            ,div
                            [class "Flex1"][]
                            ,div
                            [class "Flex10"]
                            [
                              div
                              [style[("line-height", "0px"), ("margin", "0"), ("padding", "0")]]
                              [
                                p[][text (model.currentWeather.precipitation++" in millimeters")]
                              ]
                            ]
                          ]
                          ,iconHandler model
                        ]
                      ]
                      ,div [class "Flex5"][]
                    ]
                  ]
                ]
                ,div
                  [class "Flex1"]
                  [
                    div
                    [class "PageHeading redBack blackColor"]
                    [
                      p[][text "Socket Requests"]
                    ]
                    ,div
                    [class "PageText blackBack whiteColor"
                    , style[("position", "relative")]]
                    [
                      div
                      [class "FlexRow"]
                      [
                        div
                        [class "Flex3"]
                        [
                          div
                          [class "blueBack whiteColor"
                          , style[("height", "30vh"), ("color", "white"), ("padding", "1vh"), ("borderRadius", "25px")]]
                          [
                            p[][text "Retrieve stories from Wired"]
                            ,buttonHandler model
                          ]
                        ]
                        , div [class "Flex3"][]
                      ]
                    ]
                  ]
            ]
        ]
    ]

iconHandler : Model.Model -> Html Update.Msg
iconHandler model =
  if model.currentWeather.icon /= "no image" then
    div
      [class "IconPlacer"]
      [
        img [ src ("http://"++model.currentWeather.icon)] []
      ]
  else
    div[][]

buttonHandler : Model.Model -> Html Update.Msg
buttonHandler model =
  if model.wiredStories.story1title == "" then
    div
      []
      [
        button [onClick Send] [text "Send message to server!"]
      ]
  else
    div
      []
      [
        p[][ text "Currently retrieving story from Wired!"]
        ,p[][ text model.wiredStories.story1title]
        ,p[][ text model.wiredStories.story1description]
        ,p[][ text model.wiredStories.story1link]
        ,p[][ text ("Number of times backend updated: "++(toString model.socketMessage))]
      ]

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
                  [class "PageHeading"]
                  [
                    p[][text "Http Requests"]
                  ]
                  , div
                    [class "PageText"]
                    [
                      button [ onClick GetWeather ] [ text "Get Weather Forecast" ]
                    ]
                ]
            ]
        ]
    ]

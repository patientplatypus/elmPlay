module Pages.Contact exposing (..)

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
                  [class "PageTitle"]
                  [
                    p[][text "Contact Page"]
                  ]
                ]
              , div
                [class "Flex1"]
                [
                  div
                  [class "PageContent"]
                  [
                    p[][text "Page Content Goes Here"]
                  ]
                ]
            ]
        ]
    ]

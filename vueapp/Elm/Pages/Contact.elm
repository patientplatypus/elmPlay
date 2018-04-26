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
                  [class "PageTitle blueBack blackColor"]
                  [
                    p[][text "Contact Page"]
                  ]
                ]
              , div
                [class "Flex1"]
                [
                  div
                  [class "FlexRow blueBack blackColor"
                  , style[("width", "80%"), ("margin-left", "7%"), ("margin-top", "2vh"), ("borderRadius", "25px"), ("font-size", "25px")]]
                  [
                    p[style[("paddingLeft", "10vw")]]
                      [text "Feel free to contact me by:"]
                    ,ul [class "ulStyling", style[("paddingLeft", "10vw")]][
                      li[][
                        text "phone: 828 273 5594"
                      ]
                      ,li[][
                        text "email: pweyand@gmail.com"
                      ]
                      ,li[][
                        text "linkedin: linkedin.com/peterweyand"
                      ]
                    ]
                  ]
                ]
            ,div
              [class "Flex1"
              , style[("width", "80%"), ("marginLeft", "10%"), ("marginTop", "4vh")]]
              [
                img [src "http://funkyimg.com/i/2Fq4J.jpg"][]
              ]
            ]
            ,div
              [style[("position", "absolute"), ("top", "15vh"), ("right", "2.5vw"),("width", "15vw")]]
              [

                img [src "http://funkyimg.com/i/2Fq5o.jpg", style[("maxHeight", "100%"), ("maxWidth", "100%")]][]
              ]
        ]
    ]

-- import Html exposing (Html, button, div, text, p, div, br)
-- import Html.Events exposing (onClick)

port module Main exposing (..)


import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Pages.About as About
import Pages.Contact as Contact
import Pages.Examples as Examples

import Model exposing (..)
import Update exposing (..)
import WebSocket exposing (..)

-- MAIN

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- SUBSCRIPTIONS

subscriptions : Model.Model -> Sub Msg
subscriptions model =
  Sub.batch
    [
      WebSocket.listen "ws://localhost:8080/connection" Receive,
      getJStime SetjsTime
    ]


-- PORT

port getJStime : (String -> msg) -> Sub msg

-- VIEW

view : Model.Model -> Html Update.Msg
view model =
  div [ class "MainContainer"]
    [
    div
      [ class "Title"
        , style[("backgroundColor", "black"), ("color", "white")]
      ]
      [ p [] [ text "Toy Elm Application - patientPlatypus" ] ]
    , div
      [ class "FlexRow ButtonContainer"
        , style[("backgroundColor", "black"), ("color", "white")]
      ]
      [
        div
          [class "Flex1 PageButtons"
           , onClick (ChangePage (1))]
          [p [] [text "About"]]
        ,div
          [class "Flex1 PageButtons"
           , onClick (ChangePage (2))]
          [p [] [text "Examples"]]
        ,div
          [class "Flex1 PageButtons"
           , onClick (ChangePage (3))]
          [p [] [text "Contact"]]
      ]
    ,
        pageHandler model
    ]

-- PAGE HANDLER

pageHandler : Model.Model -> Html Update.Msg
pageHandler model =
  if model.page == 1 then
    About.page model
  else if model.page == 2 then
    Examples.page model
  else
    Contact.page model



-- pageHandler:  msg -> Int -> Html msg
-- pageHandler msg pagenum =




-- SCRATCH (NON_COMPILE!!!)

-- -- TEST
--

    -- Increment ->
    --   {model | counter = model.counter + 1}
    -- Decrement ->
    --   {model | counter = model.counter - 1}


-- test : Int -> Html Msg
-- test number =
--   if number > 4 then div [] [ text (toString number) ] else div [] [ text ("number less than 4") ]
--
--     , button [ onClick Decrement ] [ text "-" ]
--     , test model.counter
--     , button [ onClick Increment ] [ text "+" ]

-- div [] [ text (toString model) ]

--     div
--         [ class "todomvc-wrapper"
--         , style [ ( "visibility", "hidden" ) ]
--         ]
--         [ section
--             [ class "todoapp" ]
--             [ lazy viewInput model.field
--             , lazy2 viewEntries model.visibility model.entries
--             , lazy2 viewControls model.visibility model.entries
--             ]
--         , infoFooter
-- ]

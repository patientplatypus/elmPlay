module Update exposing (..)

import Model exposing (..)

import Http
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)

init : (Model.Model, Cmd Msg)
init =
  ({counter=0, page=0, dummy=0, item={status= "", value= ""}}, Cmd.none)


type Msg = ChangePage Int | GetWeather | WeatherResult (Result Http.Error Item)
update : Msg -> Model.Model -> (Model.Model, Cmd Msg)
update msg model =
  case msg of
    ChangePage pageNum ->
      ({model | page = pageNum}, Cmd.none)
    GetWeather ->
      let
        cmd =
           Http.send WeatherResult <|
                        Http.get "http://localhost:3000/fetchweather" decodeItem
      in
        ( model, cmd )
    WeatherResult (Ok item) ->
            ( { model | item = item }, Cmd.none )
    WeatherResult (Err err) ->
            let
              _ = Debug.log "Http error" err
            in
            ({ model | item = model.item }, Cmd.none)


type alias Item =
    { status : String
    , value  : String
    }

decodeItem : Json.Decode.Decoder Item
decodeItem =
    Json.Decode.Pipeline.decode Item
        |> Json.Decode.Pipeline.required "status" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "value" (Json.Decode.string)


-- SCRATCH BELOW THIS LINE

-- corsGET : String -> Http.Request
-- corsGET url =
--     { verb = "GET"
--     , headers =
--         [ ("Origin", "*")
--         , ("Access-Control-Request-Method", "GET")
--         , ("Access-Control-Request-Headers", "X-Custom-Header")
--         ]
--     , url = url
--     }

-- crossOriginGet : String -> String -> Task RawError Response
-- crossOriginGet origin url =
--   send defaultSettings
--     { verb = "GET"
--     , headers = [("Origin", origin)]
--     , url = url
--     , body = empty
--     }


-- type Msg = ChangePage Int | GetWeather | WeatherResult (Result Http.Error Item)
-- update : Msg -> Model.Model -> (Model.Model, Cmd Msg)
-- update msg model =
--   case msg of
--     ChangePage pageNum ->
--       ({model | page = pageNum}, Cmd.none)
--     GetWeather ->
--       let
--         cmd =
--           Http.send WeatherResult <|
--               Http.get "http://localhost:3000/fetchweather" decodeItem
--       in
--         ( model, cmd )
--     WeatherResult (Ok item) ->
--             ( { model | item = item }, Cmd.none )
--     WeatherResult (Err err) ->
--             ({ model | item = model.item }, Cmd.none)

port module Update exposing (..)

import Model exposing (..)

import Http
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import WebSocket exposing (..)

init : (Model.Model, Cmd Msg)
init =
  ({
    counter = 0
    , page = 1
    , dummy = 0
    , weatherCity = ""
    , item = {status = "", value = ""}
    , currentWeather = {
        status = ""
        , place = "No location yet!"
        , temp = "No temperature yet!"
        , description = "No description yet!"
        , icon = "no image"
        , humidity = "No humidity yet!"
        , precipitation = "No precipiation yet!"
      }
    , socketMessage = 0
    , jsTime = ""
    , wiredStories =
      {
        story1title = "",
        story1description = "",
        story1link = ""
      }
    }
  , Cmd.none)


--PORT
port askJStime : String -> Cmd msg

-- UPDATE

type Msg = ChangePage Int | Send | Receive String | GetWeather | PickCity String | WeatherResult (Result Http.Error CurrentWeather) | SetjsTime String | RetrievejsTime
update : Msg -> Model.Model -> (Model.Model, Cmd Msg)
update msg model =
  case msg of
    ChangePage pageNum ->
      ({model | page = pageNum}, Cmd.none)
    PickCity city ->
      ({model | weatherCity = city}, Cmd.none)
    GetWeather ->
      let
        cmd =
           Http.send WeatherResult <|
                        Http.get ("http://localhost:3000/fetchweather/"++model.weatherCity) decodeCurrentWeather
      in
        ( model, cmd )
    WeatherResult (Ok currentWeather) ->
      let
        _ = Debug.log "OK item" currentWeather
      in
      ( { model | currentWeather = currentWeather }, Cmd.none )
    WeatherResult (Err err) ->
      let
        _ = Debug.log "Http error" err
      in
      ({ model | currentWeather = model.currentWeather }, Cmd.none)
    Send ->
      let
        _ = Debug.log "inside send"
      in
      (model, WebSocket.send "ws://localhost:8080/connection" "message")
    Receive message ->
      let
        _ = Debug.log "sock:" message
        result = Json.Decode.decodeString (Json.Decode.index 0 decodeWiredStories) message
      in
      receiveResult result model
    SetjsTime time ->
      ({ model | jsTime = time}, Cmd.none)
    RetrievejsTime ->
      ( model, askJStime (toString "get time!"))
          -- toString <| decode message

receiveResult : Result String WiredStories -> Model.Model -> (Model.Model, Cmd Msg)
receiveResult result model =
  case result of
    Ok message ->
      let
        _ = Debug.log "OK message" message
      in
      ({ model | socketMessage=model.socketMessage+1, wiredStories = message }, Cmd.none)
    Err error ->
      let
        _ = Debug.log "ERROR message" error
      in
      ({ model | socketMessage = -1 }, Cmd.none)


type alias CurrentWeather =
  {status: String
    , place: String
    , temp: String
    , description: String
    , icon: String
    , humidity: String
    , precipitation: String
  }

type alias WiredStories =
  { story1title : String
  , story1description : String
  , story1link : String
  }

decodeWiredStories : Json.Decode.Decoder WiredStories
decodeWiredStories =
    Json.Decode.Pipeline.decode WiredStories
        |> Json.Decode.Pipeline.required "story1title" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "story1description" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "story1link" (Json.Decode.string)


decodeCurrentWeather : Json.Decode.Decoder CurrentWeather
decodeCurrentWeather =
  Json.Decode.Pipeline.decode CurrentWeather
    |> Json.Decode.Pipeline.required "status" (Json.Decode.string)
    |> Json.Decode.Pipeline.required "place" (Json.Decode.string)
    |> Json.Decode.Pipeline.required "temp" (Json.Decode.string)
    |> Json.Decode.Pipeline.required "description" (Json.Decode.string)
    |> Json.Decode.Pipeline.required "icon" (Json.Decode.string)
    |> Json.Decode.Pipeline.required "humidity" (Json.Decode.string)
    |> Json.Decode.Pipeline.required "precipitation" (Json.Decode.string)

-- decodeWiredStories : Json.Decode.Decoder WiredStories
-- decodeWiredStories =
--   Json.Decode.Pipeline.decode WiredStories
--     |> Json.Decode.Pipeline.required "story1title" (Json.Decode.string)
--     |> Json.Decode.Pipeline.required "story1description" (Json.Decode.string)
--     |> Json.Decode.Pipeline.required "story1link" (Json.Decode.string)
--     |> Json.Decode.Pipeline.required "story2title" (Json.Decode.string)
--     |> Json.Decode.Pipeline.required "story2description" (Json.Decode.string)
--     |> Json.Decode.Pipeline.required "story2link" (Json.Decode.string)
--     |> Json.Decode.Pipeline.required "story3title" (Json.Decode.string)
--     |> Json.Decode.Pipeline.required "story3description" (Json.Decode.string)
--     |> Json.Decode.Pipeline.required "story3link" (Json.Decode.string)


-- listDecoder : Decoder (List WiredStories)
-- listDecoder =
--   Json.Decode.list decodeWiredStories
--
-- decoded : String -> Result String (List WiredStories)
-- decoded json =
--   Json.Decode.decodeString listDecoder json
--
--
-- decodeWiredStories : Decoder WiredStories
-- decodeWiredStories =
--     decode WiredStories
--         |> required "story1title" string
--         |> required "story1description" string
--         |> required "story1link" string
--         |> required "story2title" string
--         |> required "story2description" string
--         |> required "story2link" string
--         |> required "story3title" string
--         |> required "story3description" string
--         |> required "story3link" string


-- SCRATCH BELOW THIS LINE


 -- status: 'Success',
 --  placeString: 'Austin, Texas, United States of America',
 --  tempC: '18.9',
 --  description: 'Sunny',
 --  icon: '//cdn.apixu.com/weather/64x64/day/113.png',
 --  humidity: '49',
 --  precipitationMM: '0' }

-- type alias Item =
--     { status : String
--     , value  : String
--     }
--
-- decodeItem : Json.Decode.Decoder Item
-- decodeItem =
--     Json.Decode.Pipeline.decode Item
--         |> Json.Decode.Pipeline.required "status" (Json.Decode.string)
--         |> Json.Decode.Pipeline.required "value" (Json.Decode.string)


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

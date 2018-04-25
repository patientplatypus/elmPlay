module Model exposing (..)

import Http
import Json.Decode as Decode
import WebSocket exposing (..)



type alias Model = {
  counter : Int
  , page : Int
  , dummy: Int
  , weatherCity: String
  , item: {status: String, value: String}
  , currentWeather:
      {
        status: String
        , place: String
        , temp: String
        , description: String
        , icon: String
        , humidity: String
        , precipitation: String
      }
  , socketMessage: Int
  , jsTime: String
  , wiredStories:
    {
      story1title: String,
      story1description: String,
      story1link: String
    }
  }
model : Model
model =
  { counter = 0
  , page = 1
  , dummy = 0
  , weatherCity = ""
  , item = {status = "", value = ""}
  , currentWeather = {
      status = ""
      , place = ""
      , temp = ""
      , description = ""
      , icon = ""
      , humidity = ""
      , precipitation = ""
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

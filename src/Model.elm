module Model exposing (..)

import Http
import Json.Decode as Decode



type alias Model = {
  counter : Int
  , page : Int
  , dummy: Int
  , item: {status: String, value: String}
  }
model : Model
model =
  { counter = 0
  , page = 1
  , dummy = 0
  , item={status="", value=""}
  }

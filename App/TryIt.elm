module App.Main where

import Html exposing (div, text, Html, input)
import Html.Attributes exposing (type')
import Html.Events exposing (targetValue, on)
import StartApp
import Signal exposing (Address, message)
import Debug
import String

main = 
    StartApp.start { model = model, view = view, update = update}

type alias Model = String
model : Model
model = "I am a model. Are you?"

type Action = UpdateText String

update : Action -> Model -> Model
update action model = 
    case action of 
        UpdateText newStr -> newStr

view : Address Action -> Model -> Html
view address model = 
    div [] 
    [ input [type' "text", on "input" targetValue (\str -> message address (UpdateText str))] []
    , text (String.reverse model)
    ]


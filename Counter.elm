module Counter where

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Color exposing (blue)
import Debug

-- MODEL

type alias Model = Int

-- UPDATE

type Action = Increment | Decrement | Multiply

update : Action -> Model -> Model
update action model =
  case action of
    Increment -> model + 1
    Decrement -> model - 1
    Multiply -> model * 3

-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  let log = Debug.log "The number is" (model) 
  in
    div []
        [ button [ onClick address Decrement ] [ text "-" ]
        , div [ countStyle ] [ text (toString model) ]
        , button [ onClick address Increment ] [ text "+" ]
        , button [ onClick address Multiply ] [ text "*" ]
        ]

countStyle : Attribute
countStyle = 
    style
        [ ("font-size", "20px")
        , ("font-family", "monospace")
        , ("display", "inline-block")
        , ("width", "50px")
        , ("text-align", "center")
        ]
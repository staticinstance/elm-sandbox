module CounterCrowd where

import Counter
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- MODEL

type alias Model =
    { topCounter : Counter.Model
    , middleCounter: Counter.Model
    , bottomCounter : Counter.Model
    }


init : Int -> Int -> Int-> Model
init top middle bottom =
    { topCounter = Counter.init top
    , middleCounter = Counter.init middle
    , bottomCounter = Counter.init bottom
    }


-- UPDATE

type Action
    = Reset
    | Top Counter.Action
    | Middle Counter.Action
    | Bottom Counter.Action


update : Action -> Model -> Model
update action model =
  case action of
    Reset -> init 0 0 0

    Top act ->
      { model |
          topCounter = Counter.update act model.topCounter
      }
    
    Middle act ->
      { model |
          middleCounter = Counter.update act model.middleCounter
      }

    Bottom act ->
      { model |
          bottomCounter = Counter.update act model.bottomCounter
      }


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ Counter.view (Signal.forwardTo address Top) model.topCounter
    , Counter.view (Signal.forwardTo address Middle) model.middleCounter
    , Counter.view (Signal.forwardTo address Bottom) model.bottomCounter
    , button [ onClick address Reset ] [ text "RESET" ]
    ]
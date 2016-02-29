import Counter exposing (update, view)
import StartApp.Simple exposing (start)

main = 
    start
        {
            model = 1,
            view = view,
            update = update
        }
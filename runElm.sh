#!/bin/bash
echo In runElm
echo here are the files in the directory
ls
echo now running elm-reactor
elm-reactor --address=0.0.0.0 --port=8080


# OTHER WAYS TO COMPILE BELOW

# elm-make ./src/Main.elm --output=main.js
# python -m SimpleHTTPServer 8000

# this will live reload the html file, but it won't recompile the elm file
# live-server --port=8000 --host=0.0.0.0

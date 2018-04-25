#!/bin/bash
# cd ..
echo compiling elm main.js
elm-make ./src/Main.elm --output=./elmBuild/main.js
echo starting python SimpleHTTPServer
python -m SimpleHTTPServer 8000

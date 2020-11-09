#!/bin/bash

chmod +x z1910234db.sh
./z1910234db.sh DB new "Example for Assignment"
./z1910234db.sh DB add Ford Mustang 2008 "blue with white stripes"
./z1910234db.sh DB add Mitsubishi Lancer 2009 white
./z1910234db.sh DB add Toyota "Camry LE" 2004 black
./z1910234db.sh DB add Porsche "Cayenne S" 2007 red
./z1910234db.sh DB show all
./z1910234db.sh DB delete single 2
./z1910234db.sh DB show all DB count 3
cat DB

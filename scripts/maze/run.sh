magick -size 2240x1400 xc:#$1 $HOME/nix/scripts/maze/fill.png
magick $HOME/nix/scripts/maze/fill.png -pointsize 40 -fill "#$2" -gravity Center -annotate 0 "$(node $HOME/nix/scripts/maze/maze.js)" $HOME/nix/scripts/maze/maze.png

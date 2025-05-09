# $1 - bg
# $2-$9 - random fg
arr=("$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9")
index=$(( RANDOM % ${#arr[@]} ))
random_value="${arr[$index]}"

magick -size 2240x1400 xc:#$1 $HOME/nix/scripts/maze/fill.png

magick $HOME/nix/scripts/maze/fill.png \
  -pointsize 40 \
  -fill "#$random_value" \
  -gravity Center \
  -annotate 0 "$(node $HOME/nix/scripts/maze/maze.js)" \
  -modulate 60,100,100 \
  $HOME/nix/scripts/maze/maze.png

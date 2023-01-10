#!/usr/bin/env bash

BRUHPATH="$HOME/dotfiles/files"
# Look, I get that hard-coding a path is indeed a 'bruh moment' (hence the 
# name), but it already took so much effort just to get to this point. I'll
# fix this when I get better at shell-scripting.

for f in $(ls -A "$BRUHPATH"); do
	ln -s "$BRUHPATH/$f" "$HOME/$f"
done

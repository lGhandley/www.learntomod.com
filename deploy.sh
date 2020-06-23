#!/bin/bash

# Get things into a clean state.  Ignore errors if things were already clean
rm -rf out &>/dev/null
git branch gh-pages &>/dev/null
git worktree prune
git worktree add out gh-pages

touch out/site_prefix #Temporary hack.  raco website-preview should be smarter about this

#Generate the site
racket main.rkt 

#Deploy it
cd out/
git add . -f
git commit -m "deploy"
git push -f origin gh-pages

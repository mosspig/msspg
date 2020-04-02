#!/bin/bash

git add *
git commit -m 'update'
git push
cp -r _site/* ../mosspig.github.io/
cd ../mosspig.github.io/
git add *	
git commit -m 'update'
git push

#!/bin/bash
rake generate
rake deploy
git add .
git commit -a
git push origin source

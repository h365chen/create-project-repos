#!/bin/bash

cat students.csv | while read line
do
  git clone ist-git@git.uwaterloo.ca:ece459-1241-practice/ece459-1241-practice-repo-$line.git
  cd ece459-1241-practice-repo-$line
  glab api --silent --method PUT /projects/:id --field ci_config_path=".gitlab-ci.yml@h365chen/ece459-1241-ci"
  cd ..
  rm -r ece459-1241-practice-repo-$line
done


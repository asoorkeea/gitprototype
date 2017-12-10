#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Invalid number of arguments"
    echo "USAGE: $0 <version>"
    exit 1
fi

version=$1
working_dir="$( pwd )/my-app"

echo "Switching to directory $working_dir"
cd $working_dir
echo "Updating version to $version in all poms"
mvn versions:set -DnewVersion=$version
echo "Comitting version to $version in all poms"
mvn versions:commit
echo "Adding all poms to staging area"
cd $working_dir/../
git ls-files | grep 'pom.xml$' | xargs git add
echo "Committing all poms to local branch"
git commit -m "Updated to version $version."
echo "Pushing all poms to remote branch master"
git push origin master
echo "Change completed successfully."






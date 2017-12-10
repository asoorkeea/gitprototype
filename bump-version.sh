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
echo "Committing version changes"

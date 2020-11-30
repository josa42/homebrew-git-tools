#!/bin/bash

name="$1"
filePath="$(pwd)/Formula/$name.rb"
version=$2

([[ $name != "" ]] && [ -e "$filePath" ] && [[ $version != "" ]]) || exit 1

url=$(cat $filePath | grep 'url "' | sed 's/^.*url "//' | sed 's/"$//' | sed "s/#{version}/$version/")

tmpFile=/tmp/git-tools-update-$name-$version
curl -sSL $url > $tmpFile
hash=$(sha256sum $tmpFile | sed 's/ .*//')
rm $tmpFile

v="$(echo $version | sed 's/^v//')"
cat $filePath \
  | sed "s/version \".*/version \"$v\"/" \
  | sed "s/sha256.*/sha256 \"$hash\"/" \
  > $filePath.tmp

cat $filePath.tmp

read -p "Are you sure? " -n 1 -r
echo
if ! [[ $REPLY =~ ^[Yy]$ ]]
then
  rm $filePath.tmp
  exit
fi

rm $filePath
mv $filePath.tmp $filePath

brew unlink $filePath || exit 1
brew install $filePath || exit 1
brew test $filePath || exit 1

git add $filePath
git commit -m "⬆️  Update $name to $version"


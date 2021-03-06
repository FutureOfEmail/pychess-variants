#!/bin/sh

# Learn docs
cd static/docs

export PATH="../../node_modules/.bin/:$PATH"

for f in *.md; do
showdown makehtml -i "$f" -o "$(basename -- "$f" .md).html" --flavor github
done

for f in hu/*.md; do
showdown makehtml -i "$f" -o "$(basename -- "$f" .md).hu.html" --flavor github
done

for f in it/*.md; do
showdown makehtml -i "$f" -o "$(basename -- "$f" .md).it.html" --flavor github
done

for f in pt/*.md; do
showdown makehtml -i "$f" -o "$(basename -- "$f" .md).pt.html" --flavor github
done

for f in fr/*.md; do
showdown makehtml -i "$f" -o "$(basename -- "$f" .md).fr.html" --flavor github
done

showdown makehtml -i "zh/intro.md" -o "intro.zh.html" --flavor github


SRC='https://github.com/gbtami/pychess-variants/blob/master'; 
DST='https://www.pychess.org';
find . -type f -name "*.html" -exec sed -i 's,'"$SRC"','"$DST"',' {} \;

mkdir ../../templates/docs
mv -t ../../templates/docs *.html

# News
cd ../news

for f in *.md; do
showdown makehtml -i "$f" -o "$(basename -- "$f" .md).html" --flavor github
done

find . -type f -name "*.html" -exec sed -i 's,'"$SRC"','"$DST"',' {} \;

mkdir ../../templates/news
mv -t ../../templates/news *.html

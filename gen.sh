#!/bin/sh

# NOTE: this file is a modified version of gist:
# https://gist.github.com/bmaupin/6e3649af73120fac2b6907169632be2c

mkdir -p output

ROOT_DIR=$PWD
FONT_PATH=/usr/share/fonts/ttf-dejavu/DejaVuSansMono.ttf

TITLE="You Don't Know JS Yet"
AUTHOR="Kyle Simpson"

BOOK1="Get Started"
BOOK2="Scope & Closures"
BOOK3="Objects & Classes"
BOOK4="Types & Grammar"
BOOK5="Sync & Async"
BOOK6="ES.Next & Beyond"

echo "Preparing..."

# Clean up redundant headings that end up getting split into separate chapters by themselves
find . -iname "*.md" -exec sed -i '/# You Don'\''t Know JS.*/d' {} \;
# Fix <br> tags which pandoc won't convert to <br />
find . -iname "*.md" -exec sed -i 's#<br>#<br />#g' {} \;
# Close img tags
find . -iname "*.md" -exec sed -i -r 's#(<img.*[^/])>#\1 />#' {} \;

cd 2nd-ed

echo "Generating: $BOOK1..."
cd get-started
pandoc -f markdown+smart -o "$ROOT_DIR/output/$TITLE - $BOOK1.epub" \
  --epub-cover-image=images/cover.png \
  --epub-embed-font=$FONT_PATH \
  --css=$ROOT_DIR/epub.css \
  --no-highlight \
  -M author="$AUTHOR" \
  -M title="$TITLE: $BOOK1" \
  foreword.md \
  ../preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  ch4.md \
  apA.md \
  apB.md
cd ..

echo "Generating: $BOOK2..."
cd scope-closures
pandoc -f markdown+smart -o "$ROOT_DIR/output/$TITLE - $BOOK2.epub" \
  --epub-cover-image=images/cover.png \
  --epub-embed-font=$FONT_PATH \
  --css=$ROOT_DIR/epub.css \
  --no-highlight \
  -M author="$AUTHOR" \
  -M title="$TITLE: $BOOK2" \
  foreword.md \
  ../preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  ch4.md \
  ch5.md \
  ch6.md \
  ch7.md \
  ch8.md \
  apA.md \
  apB.md
cd ..


# ==== NOTE: the 6 books below are from the 1st edition ====

cd $ROOT_DIR/1st-ed

TITLE="You Don't Know JS"

BOOK1="Up & Going"
BOOK2="Scope & Closures"
BOOK3="this & Object Prototypes"
BOOK4="Types & Grammar"
BOOK5="Async & Performance"
BOOK6="ES6 & Beyond"

echo "Generating: $BOOK1..."
cd "up & going"
pandoc -f markdown+smart -o "$ROOT_DIR/output/$TITLE - $BOOK1.epub" \
  --epub-cover-image=cover.jpg \
  --epub-embed-font=$FONT_PATH \
  --css=$ROOT_DIR/epub.css \
  --no-highlight \
  -M author="$AUTHOR" \
  -M title="$TITLE: $BOOK1" \
  foreword.md \
  ../preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  apA.md
cd ..

echo "Generating: $BOOK2..."
cd "scope & closures"
pandoc -f markdown+smart -o "$ROOT_DIR/output/$TITLE - $BOOK2.epub" \
  --epub-cover-image=cover.jpg \
  --epub-embed-font=$FONT_PATH \
  --css=$ROOT_DIR/epub.css \
  --no-highlight \
  -M author="$AUTHOR" \
  -M title="$TITLE: $BOOK2" \
  ../preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  ch4.md \
  ch5.md \
  apA.md \
  apB.md \
  apC.md
cd ..


echo "Generating: $BOOK3..."
cd "this & object prototypes"
pandoc -f markdown+smart -o "$ROOT_DIR/output/$TITLE - $BOOK3.epub" \
  --epub-cover-image=cover.jpg \
  --epub-embed-font=$FONT_PATH \
  --css=$ROOT_DIR/epub.css \
  --no-highlight \
  -M author="$AUTHOR" \
  -M title="$TITLE: $BOOK3" \
  foreword.md \
  ../preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  ch4.md \
  ch5.md \
  ch6.md \
  apA.md \
  apB.md
cd ..

echo "Generating: $BOOK4..."
cd "types & grammar"
pandoc -f markdown+smart -o "$ROOT_DIR/output/$TITLE - $BOOK4.epub" \
  --epub-cover-image=cover.jpg \
  --epub-embed-font=$FONT_PATH \
  --css=$ROOT_DIR/epub.css \
  --no-highlight \
  -M author="$AUTHOR" \
  -M title="$TITLE: $BOOK4" \
  foreword.md \
  ../preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  ch4.md \
  ch5.md \
  apA.md \
  apB.md
cd ..

echo "Generating: $BOOK5..."
cd "async & performance"
pandoc -f markdown+smart -o "$ROOT_DIR/output/$TITLE - $BOOK5.epub" \
  --epub-cover-image=cover.jpg \
  --epub-embed-font=$FONT_PATH \
  --css=$ROOT_DIR/epub.css \
  --no-highlight \
  -M author="$AUTHOR" \
  -M title="$TITLE: $BOOK5" \
  foreword.md \
  ../preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  ch4.md \
  ch5.md \
  ch6.md \
  apA.md \
  apB.md \
  apC.md
cd ..

echo "Generating: $BOOK6..."
cd "es6 & beyond"
pandoc -f markdown+smart -o "$ROOT_DIR/output/$TITLE - $BOOK6.epub" \
  --epub-cover-image=cover.jpg \
  --epub-embed-font=$FONT_PATH \
  --css=$ROOT_DIR/epub.css \
  --no-highlight \
  -M author="$AUTHOR" \
  -M title="$TITLE: $BOOK6" \
  foreword.md \
  ../preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  ch4.md \
  ch5.md \
  ch6.md \
  ch7.md \
  ch8.md \
  apA.md
cd ..

# ==== Functional-Light JavaScript ====

cd $ROOT_DIR/Functional-Light-JS

TITLE="Functional-Light JavaScript"

echo "Generating: $TITLE..."
cd "manuscript"
pandoc -f markdown+smart -o "$ROOT_DIR/output/$TITLE.epub" \
  --epub-cover-image=images/marketing/front-cover-sd.png \
  --epub-embed-font=$FONT_PATH \
  --css=$ROOT_DIR/epub.css \
  --no-highlight \
  -M author="$AUTHOR" \
  -M title="$TITLE" \
  foreword.md \
  preface.md \
  ch1.md \
  ch2.md \
  ch3.md \
  ch4.md \
  ch5.md \
  ch6.md \
  ch7.md \
  ch8.md \
  ch9.md \
  ch10.md \
  ch11.md \
  apA.md \
  apB.md \
  apC.md
cd ..

echo "Done."

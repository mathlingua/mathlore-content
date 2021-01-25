#!/usr/bin/env bash

echo "Running 'mlg check'"
./mlg check

echo ""
echo "Checking if the docs directory is up-to-date"
# create a temp directory to store the current docs
mkdir -p .original

# create a docs directory if it does not exist so that
# the mv command on the next line will always work
mkdir -p .original

# backup the current docs
mv docs .original

# generate the docs based on the current content
echo ""
echo "Re-rendering the docs directory"
./mlg render

# compare the newly generated docs with the original docs
# If there is a difference, `diff` returns a non-zero exit
# code.  This difference means the docs directory is not
# up-to-date with the content
echo ""
echo "Comparing the newly generated docs to the original docs"
diff -r docs .original/docs

echo ""
echo "Restoring the original docs"
# remove the newly generated docs
rm -Rf docs

# restore the original docs
mv .original/docs .

# remove the temp directory
rm -Rf .original

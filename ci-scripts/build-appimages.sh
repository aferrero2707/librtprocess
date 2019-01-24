#! /bin/bash

echo "TARGET_PROJECT: $TARGET_PROJECT"
if [ "$TARGET_PROJECT" = "RawTherapee" ]; then

	echo "Preparing to build $TARGET_PROJECT"
	rm -rf /sources/ci
	cp -a /sources/ci-scripts/rt /sources/ci

fi
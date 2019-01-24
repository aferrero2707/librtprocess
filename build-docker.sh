#! /bin/bash

WD=$(pwd)
mkdir -p .temp || exit 1
cd .temp || exit 1

export LIBRT_BRANCH=master
#rm -rf RawTherapee
if [ ! -e librtprocess-${LIBRT_BRANCH} ]; then
	git clone https://github.com/aferrero2707/librtprocess.git --branch ${LIBRT_BRANCH} --single-branch librtprocess-${LIBRT_BRANCH}
fi

cd librtprocess-${LIBRT_BRANCH}
#pwd
#exit



rm -rf ci-scripts
cp -a "$WD/ci-scripts" .

#docker run -it -v $(pwd):/sources -e "RT_BRANCH=$RT_BRANCH" photoflow/docker-centos7-gtk bash
docker run -it -v $(pwd):/sources -e "LIBRT_BRANCH=$LIBRT_BRANCH" -e "TARGET_PROJECT=RawTherapee" centos:7 bash #/sources/ci/appimage-centos7.sh


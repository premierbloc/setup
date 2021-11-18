#!/bin/sh -l

case $GITHUB_REF in
    refs/tags/*        ) environment=production; tag=$GITHUB_REF_NAME ;;
    refs/heads/main    ) environment=stage; tag=$GITHUB_SHA ;;
    refs/pull/*        ) environment=pullrequest-${INPUT_NUMBER}; tag=$GITHUB_SHA ;;
    *                  ) environment=''
esac

env

echo "::set-output name=environment::$environment"
echo "::set-output name=application::$(basename $GITHUB_REPOSITORY)"
echo "::set-output name=tag::$tag"
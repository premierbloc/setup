#!/bin/sh -l

tag=$GITHUB_SHA
case $GITHUB_REF in
    refs/tags/*        ) environment=production; tag=$GITHUB_REF_NAME ;;
    refs/heads/main    ) environment=stage ;;
    refs/pull/*        ) environment=pullrequest-${INPUT_NUMBER} ;;
    *                  ) environment=''
esac

echo "::set-output name=environment::$environment"
echo "::set-output name=application::$(basename $GITHUB_REPOSITORY)"
echo "::set-output name=tag::$tag"
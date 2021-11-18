#!/bin/sh -l

case $GITHUB_REF in
    refs/tags/*        ) environment=production ;;
    refs/heads/main    ) environment=stage ;;
    refs/pull/*        ) environment=pullrequest-${INPUT_NUMBER} ;;
    *                  ) environment=''
esac

env

echo "::set-output name=environment::$environment"
echo "::set-output name=application::$(basename $GITHUB_REPOSITORY)"
echo "::set-output name=tag::$(git describe --always)"
#!/bin/sh -l

tag=$GITHUB_SHA
case $GITHUB_REF in
    refs/tags/*        ) environment=production; tag=$GITHUB_REF_NAME ;;
    refs/heads/main    ) environment=stage ;;
    refs/pull/*        ) environment=pullrequest-$(dirname $GITHUB_REF_NAME) ;;
    *                  ) environment=''
esac

echo "::set-output name=application::$(basename $GITHUB_REPOSITORY)"
echo "::set-output name=environment::$environment"
echo "::set-output name=tag::$tag"
echo "TF_CLI_ARGS_init=-backend-config='bucket=$1' -backend-config='key=${GITHUB_REPOSITORY}' -backend-config='region=${AWS_DEFAULT_REGION}'" >> $GITHUB_ENV

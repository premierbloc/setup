#!/bin/sh -l

# echo "Hello $1"

echo $1

# case $1 in
#     refs/tags/*        ) environment=production ;;
#     refs/heads/main    ) environment=stage ;;
#     refs/pull/*        ) environment=pullrequest-${GITHUB_PULLREQUEST_NUMBER} ;;
#     *                  ) environment=''
# esac

env
# echo $environment
# echo "::set-output name=environment::$environment"
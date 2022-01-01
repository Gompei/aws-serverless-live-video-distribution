#!/usr/bin/env bash

# $1 スタック名, $2 デプロイするテンプレート名

if [ "$#" -ne 2 ]; then
  echo "Argument does not match"
  exit 2
fi

ROOT=$(cd "$(dirname "$0")" && pwd)
STACK_NAME=$1
TEMPLATE=$2

: deploy the stack
aws cloudformation deploy \
    --region ap-northeast-1 \
    --stack-name "$STACK_NAME" \
    --template-file "${ROOT}/${TEMPLATE}" \
    --no-fail-on-empty-changeset \
    --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND CAPABILITY_NAMED_IAM

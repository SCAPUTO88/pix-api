#!/bin/bash
set -e

echo "==> Aguardando DynamoDB iniciar..."
until awslocal dynamodb list-tables >/dev/null 2>&1; do
  sleep 2
done

echo "==> Criando tabelas..."
awslocal dynamodb create-table \
    --table-name Charges \
    --attribute-definitions AttributeName=id,AttributeType=S \
    --key-schema AttributeName=id,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST

awslocal dynamodb create-table \
    --table-name Payments \
    --attribute-definitions AttributeName=id,AttributeType=S \
    --key-schema AttributeName=id,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST
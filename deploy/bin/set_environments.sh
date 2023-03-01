#! /bin/bash

# エラーで処理中止
set -ex

env=$1
app_name="saien-nakaya"

# 一旦環境変数へ格納
=$(aws ssm get-parameters --names /${app_name}/${env}/mailgun_key --with-decryption --query "Parameters[0].Value")
=$(aws ssm get-parameters --names /${app_name}/${env}/mail_bcc --with-decryption --query "Parameters[0].Value")

echo "export MAILGUN_KEY=$mailgun_key" >> $BASH_ENV
echo "export MAIL_BCC=$mail_bcc" >> $BASH_ENV
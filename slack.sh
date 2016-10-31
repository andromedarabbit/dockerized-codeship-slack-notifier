#!/bin/sh
# Post to Slack channel on new deployment
# https://api.slack.com/incoming-webhooks
#
# You can either add those here, or configure them on the environment tab of your
# project settings.
SLACK_WEBHOOK_TOKEN=${SLACK_WEBHOOK_TOKEN:?'You need to configure the SLACK_WEBHOOK_TOKEN environment variable!'}
SLACK_BOT_NAME=${SLACK_BOT_NAME:="Codeship Bot"}
SLACK_ICON_URL=${SLACK_ICON_URL:="https://d1089v03p3mzyq.cloudfront.net/assets/website/logo-dark-90f893a2645c98929b358b2f93fa614b.png"}

SLACK_SUBJECT=${SLACK_SUBJECT:="*${CI_REPO_NAME}* is deployed!"}
SLACK_MESSAGE=${SLACK_MESSAGE:="Docker image was deployed to ${DEPLOY_TO}:${CI_BRANCH}.${CI_COMMIT_ID} from ${CI_NAME}"}

curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"username": "'"${SLACK_BOT_NAME}"'",
  "text": "'"${SLACK_SUBJECT}"'",
  "attachments": [{ "color": "good", "text": "'"${SLACK_MESSAGE}"'" }],
  "mrkdwn": true,
  "icon_url": "'"${SLACK_ICON_URL}"'"}' \
  https://hooks.slack.com/services/$SLACK_WEBHOOK_TOKEN

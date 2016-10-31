[![Docker Stars](https://img.shields.io/docker/stars/andromedarabbit/codeship-slack-notifier.svg?style=flat-square)](https://hub.docker.com/r/andromedarabbit/codeship-slack-notifier/)
[![Docker Pulls](https://img.shields.io/docker/pulls/andromedarabbit/codeship-slack-notifier.svg?style=flat-square)](https://hub.docker.com/r/andromedarabbit/codeship-slack-notifier/)


# CodeShip Slack Notifier

Docker image to send the deployment notification to Slack for CodeShip Docker infrastructure.

## Usage

### `codeship-steps.yml`

```yaml
- type: serial
  steps:
    - name: notify
      service: deploynotify
      command: /usr/local/bin/slack.sh
```

### `codeship-services.yml`

```yaml
deploynotify:
  image: andromedarabbit/codeship-slack-notifier
  encrypted_env_file: deploy.env.encrypted
```

### `deploy.env`

```ini
SLACK_WEBHOOK_TOKEN=MY_TOKEN
DEPLOY_TO=MY_REGISTRY
```

## Message Customization

### `deploy.env`

```ini
SLACK_WEBHOOK_TOKEN=MY_TOKEN
SLACK_SUBJECT="*${CI_REPO_NAME}* is deployed!"
SLACK_MESSAGE="Docker image was deployed to ${DEPLOY_TO}:${CI_BRANCH}.${CI_COMMIT_ID} from ${CI_NAME}"
```

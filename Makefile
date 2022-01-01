-include .env

MAKEFILE_DIR:=$(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))

.PHONY: help
help: ## 各makeコマンドの説明を表示します
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: deploy
deploy: ## AWSライブ動画配信環境構築
	$(MAKEFILE_DIR)/deploy.sh aws-serverless-live-video-distribution cloudformation.yaml

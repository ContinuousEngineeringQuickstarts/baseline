# Define text placeholder variables
export GITHUB_ORG = your_org
export GITHUB_PROJECT_NAME = your_project
export GITHUB_REPO = your_repo
export GITHUB_BOT_NAME = your_bot
export GITHUB_ISSUE_REPO = your_issue_repo
export GITHUB_CODEOWNERS = your_default_owner
export SONAR_PROJECT_KEY = your_sonar_project_key
export SONAR_ORGANIZATION = your_sonar_org
export SLACK_WORKSPACE = your_slack_workspace

# Target rule
update_placeholders:
	./helpers/base_update.sh
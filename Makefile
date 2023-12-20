# This Makefile is used to replace placeholders in a script with actual values.
# The placeholders are in the format ${VARIABLE_NAME} and the actual values are stored in the corresponding shell variables.
# The script to be processed is specified in the `update_placeholders` target rule.

# Define placeholder variables
# These variables are exported as environment variables so they can be accessed by the helper scripts.
export GITHUB_ORG = your_org              			# The name of your GitHub organization
export GITHUB_PROJECT_NAME = your_project 			# The name of your GitHub project
export GITHUB_REPO = your_repo            			# The name of your GitHub repository
export GITHUB_BOT_NAME = your_bot         			# The name of your GitHub bot
export GITHUB_ISSUE_REPO = your_issue_repo 			# The name of your GitHub issue repository
export GITHUB_CODEOWNERS = your_default_owner 		# The default owner of your GitHub code
export SONAR_PROJECT_KEY = your_sonar_project_key 	# The key of your Sonar project
export SONAR_ORGANISATION = your_sonar_org 			# The name of your Sonar organisation
export SLACK_WORKSPACE = your_slack_workspace 		# The name of your Slack workspace


# The rule replaces the placeholders in certain files with the actual values of the corresponding environment variables.
# This rule runs the `base_update.sh` script located in the `helpers` directory.
update_placeholders:
	./helpers/base_update.sh
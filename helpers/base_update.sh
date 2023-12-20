#!/bin/bash

# This script is used to replace placeholders in certain files with the actual values of the corresponding variables.
# The placeholders are in the format ${VARIABLE_NAME} and the actual values are stored in the corresponding environment variables.
# This script should be executed from the main `Makefile` using the environment variables defined there.

# Define an array of files that contain the placeholders to be replaced.
# The paths to the files are relative to the root of the project.
FILES=("./README.md" "./SECURITY.md" "./CONTRIBUTING.md" "./.github/pull_request_template.md" "./.github/CODEOWNERS" "./.github/workflows/sonarcloud.yml" "./docs/contributors/DEV_GUIDE.md")

# Replace the template sonarcloud.yml & CODEOWNERS file with the project specific files.
rm ./.github/workflows/sonarcloud.yml
mv ./.github/workflows/.sonarcloud.yml.tmp ./.github/workflows/sonarcloud.yml
rm ./.github/CODEOWNERS
mv ./.github/.CODEOWNERS.tmp ./.github/CODEOWNERS
echo "Switched from template to project sonarcloud.yml & CODEOWNERS"


# Iterate over each file in the array
for FILE in "${FILES[@]}"; do
    # For each file, replace the placeholders with the actual values of the corresponding variables.
    # The -i option tells sed to edit files in-place (i.e., save the changes to the original file).
    # The -e option allows you to specify multiple editing commands to `sed`.
    # Each -e is followed by a `sed` command that replaces a specific placeholder with the corresponding environment variable.
    sed -i -e "s/\${GITHUB_ORG}/$GITHUB_ORG/g" "$FILE"
    sed -i -e "s/\${GITHUB_PROJECT_NAME}/$GITHUB_PROJECT_NAME/g" "$FILE"
    sed -i -e "s/\${GITHUB_REPO}/$GITHUB_REPO/g" "$FILE"
    sed -i -e "s/\${GITHUB_BOT_NAME}/$GITHUB_BOT_NAME/g" "$FILE"
    sed -i -e "s/\${GITHUB_ISSUE_REPO}/$GITHUB_ISSUE_REPO/g" "$FILE"
    sed -i -e "s/\${GITHUB_CODEOWNERS}/$GITHUB_CODEOWNERS/g" "$FILE"
    sed -i -e "s/\${SONAR_PROJECT_KEY}/$SONAR_PROJECT_KEY/g" "$FILE"
    sed -i -e "s/\${SONAR_ORGANISATION}/$SONAR_ORGANISATION/g" "$FILE"
    sed -i -e "s/\${SLACK_WORKSPACE}/$SLACK_WORKSPACE/g" "$FILE"
    echo "Updated $FILE"
    rm "$FILE-e"
done
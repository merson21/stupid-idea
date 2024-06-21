#!/bin/bash

# Environment Variables
REPO_URL="https://github.com/merson21/stupid-idea.git"
GIT_USERNAME="merson21"
GIT_EMAIL="mersontaguiam7@gmail.com"
GHA_TOKEN="${{ secrets.GHA_TOKEN }}"
GPG_PRIVATE_KEY="$(cat secret_key.asc)"
GPG_KEY_ID="20342C64"
                
# Get random commit message
MESSAGES=("Update data" "Automated changes" "Daily commit" "Routine update" "Sync changes" "Minor adjustments")
RANDOM_INDEX=$((RANDOM % ${#MESSAGES[@]}))
COMMIT_MESSAGE=${MESSAGES[$RANDOM_INDEX]}

# Clone the repository
git clone $REPO_URL
cd stupid-idea

# Make changes
echo "$(date)" >> changes.txt

# GPG setup
export GNUPGHOME="${HOME}/.gnupg"
mkdir -p "${GNUPGHOME}"
chmod 700 "${GNUPGHOME}"

# Save GPG private key to a temporary file
echo "$GPG_PRIVATE_KEY_CONTENT" > /tmp/gpg_private_key.asc
chmod 700 *

# Check if the temporary file exists
if [ -f /tmp/gpg_private_key.asc ]; then
    echo "Temporary file created successfully"
else
    echo "Error: Temporary file not created"
    exit 1
fi

# Import GPG key from the temporary file
eval "$(gpg-agent --daemon)" > /dev/null 2>&1
export GPG_TTY=$(tty)
gpg --import /tmp/gpg_private_key.asc

# Check if the temporary file still exists after import
if [ -f /tmp/gpg_private_key.asc ]; then
    echo "Temporary file still exists after import"
else
    echo "Error: Temporary file was removed before import"
    exit 1
fi

# Remove the temporary file
rm /tmp/gpg_private_key.asc    

# Configure Git
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"
git config --global user.signingkey "$GPG_KEY_ID"
git config --global commit.gpgsign true
        
# Commit and push changes
git add changes.txt
git commit -S -m "$COMMIT_MESSAGE"
git push https://${GHA_TOKEN}@github.com/merson21/stupid-idea.git main

# Clean up
cd ..
rm -rf stupid-idea
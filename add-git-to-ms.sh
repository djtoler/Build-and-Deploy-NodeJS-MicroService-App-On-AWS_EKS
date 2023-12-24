#!/bin/bash

# Replace this with your remote repository URL
REMOTE_REPO_URL="https://github.com/djtoler/Build-and-Deploy-NodeJS-MicroService-App-On-AWS_EKS.git"

# Navigate to the base of your microservices directory
cd /home/ubuntu/quiz-app/microservices/

# Fetch the latest changes from the remote repository
git fetch origin

for dir in */ ; do
    # Remove trailing slash to get directory name
    dir_name=${dir%/}

    echo "Processing microservice: $dir_name"

    # Navigate into microservice directory
    cd "$dir_name"

    # Initialize Git (if not already)
    if [ ! -d ".git" ]; then
        git init
        git remote add origin "$REMOTE_REPO_URL"
    fi

    # Checkout a new branch named after the directory
    git checkout -b "$dir_name"

    # Add all files, commit, and push to a new branch on remote
    git add .
    git commit -m "Initial commit for $dir_name microservice"
    git push -u origin "$dir_name"

    # Navigate back to the parent directory
    cd ..

    echo "Processed microservice: $dir_name"
done

echo "All microservices processed."

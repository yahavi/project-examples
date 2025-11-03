#!/bin/bash
# Script to create Maven repositories on JFrog Fly
# Usage: FLY_TOKEN=your_token ./CREATE_REPOS.sh

FLY_URL="https://jfmarketing.jfrog.io"
FLY_TOKEN="${FLY_TOKEN:-$FLY_SECRET}"

if [ -z "$FLY_TOKEN" ]; then
  echo "Error: FLY_TOKEN or FLY_SECRET environment variable is required"
  echo "Usage: FLY_TOKEN=your_token ./CREATE_REPOS.sh"
  exit 1
fi

# Create local repository
echo "Creating fly-maven-local..."
curl -X PUT "${FLY_URL}/artifactory/api/repositories/fly-maven-local" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${FLY_TOKEN}" \
  -d @maven-local-repo.json

echo -e "\n"

# Create remote repository
echo "Creating fly-maven-remote..."
curl -X PUT "${FLY_URL}/artifactory/api/repositories/fly-maven-remote" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${FLY_TOKEN}" \
  -d @maven-remote-repo.json

echo -e "\n"

# Create virtual repository
echo "Creating fly-maven (virtual)..."
curl -X PUT "${FLY_URL}/artifactory/api/repositories/fly-maven" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${FLY_TOKEN}" \
  -d @maven-virtual-repo.json

echo -e "\n\nDone! Repositories created:"
echo "- fly-maven-local (local)"
echo "- fly-maven-remote (remote -> Maven Central)"
echo "- fly-maven (virtual, combines both)"


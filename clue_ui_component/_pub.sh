#!/bin/sh
# jq가 설치되어 있는지 확인하고 설치합니다.
if ! command -v jq &> /dev/null; then
  echo "jq is not installed. Installing jq..."
  arch -arm64 brew install jq
  if [ $? -ne 0 ]; then
    echo "Failed to install jq."
    exit 1
  fi
else
  echo "jq is already installed."
fi
UPDATE_TYPE=$1

echo "Type $UPDATE_TYPE"
# 패키지 이름을 인자로 받습니다.
PACKAGE_NAME="clue_ui_component"

# pub.dev API를 호출하여 패키지 정보를 가져옵니다.
API_URL="https://pub.dev/api/packages/$PACKAGE_NAME"

# curl로 API 호출하고 jq로 JSON 응답을 파싱하여 최신 버전 정보를 가져옵니다.
LATEST_VERSION=$(curl -s $API_URL | jq -r '.latest.version')

# API 호출이 성공했는지 확인합니다.
if [ -z "$LATEST_VERSION" ]; then
  echo "Failed to fetch package info or package does not exist."
  exit 1
fi

# 최신 버전 정보를 출력합니다.
echo "The latest version of $PACKAGE_NAME is $LATEST_VERSION"

# 버전을 . 기준으로 분리합니다.
IFS='.' read -r VERSION_MAJOR VERSION_MINOR VERSION_PATCH <<< "$LATEST_VERSION"

# 업데이트 유형에 따라 버전을 수정합니다.
case "$UPDATE_TYPE" in
  "--major")
    VERSION_MINOR=$((VERSION_MINOR + 1))
    ;;
  "--minor")
    VERSION_PATCH=$((VERSION_PATCH + 1))
    ;;
  *)
    echo "Invalid update type. Please enter '--major' or '--minor'."
    exit 1
    ;;
esac


# 새로운 버전 문자열을 만듭니다.
NEW_VERSION="${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}"
echo "New version: $NEW_VERSION"

# pubspec.yaml 파일에서 버전 문자열을 수정합니다.
if [ -f pubspec.yaml ]; then
  sed -i.bak "s/version: .*/version: $NEW_VERSION/" pubspec.yaml
  echo "Updated pubspec.yaml with new version: $NEW_VERSION"
else
  echo "pubspec.yaml file not found."
  exit 1
fi

flutter pub get
yes | flutter packages pub publish

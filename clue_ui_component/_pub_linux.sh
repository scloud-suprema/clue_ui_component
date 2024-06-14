#!/bin/sh
PACKAGE_NAME=clue_ui_component
CHANGELOG_FILE="CHANGELOG.md"

# pub.dev 페이지에서 패키지 정보를 가져옵니다.
PACKAGE_URL="https://pub.dev/packages/$PACKAGE_NAME"
PACKAGE_PAGE=$(curl -s $PACKAGE_URL)

# title 태그에서 패키지 이름 뒤의 버전 정보를 추출합니다.
LATEST_VERSION=$(echo "$PACKAGE_PAGE" | sed -n 's/.*<h1 class="title">'"$PACKAGE_NAME"' \([^<]*\).*/\1/p')

# API 호출이 성공했는지 확인합니다.
if [ -z "$LATEST_VERSION" ]; then
  echo "Failed to fetch package info or package does not exist."
  exit 1
fi

# 최신 버전 정보를 출력합니다.
echo "The latest version of $PACKAGE_NAME is $LATEST_VERSION"
# 버전을 . 기준으로 분리합니다.
IFS='.' read -r VERSION_MAJOR VERSION_MINOR VERSION_PATCH <<< "$LATEST_VERSION"

VERSION_PATCH=$((VERSION_PATCH + 1))

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

#MESSAGE=`git log --pretty=format:"%h : %s" -1`
#echo -e "## $NEW_VERSION\n* $MESSAGE\n$(cat $CHANGELOG_FILE)" > $CHANGELOG_FILE

flutter pub get
echo "y" | flutter packages pub publish

#!/bin/sh
PACKAGE_NAME=clue_ui_component
CHANGELOG_FILE="CHANGELOG.md"
# URL 설정
URL="https://pub.dev/packages/$PACKAGE_NAME"

# 페이지 내용 가져오기
page_content=$(curl -s $URL)
# echo "Page : $page_content"

# div.h1 태그의 title 클래스 값 추출
LATEST_VERSION=$(echo "$page_content" | sed -n 's/.*<h1 class="title">\([^<]*\).*/\1/p')
LATEST_VERSION=$(echo "$title_value" | cut -d ' ' -f 2)

# 결과 출력
echo "Version: $title_value"

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
yes | flutter packages pub publish

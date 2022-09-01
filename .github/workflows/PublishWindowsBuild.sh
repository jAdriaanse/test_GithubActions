echo Pushing to channel ${ITCH_GAMEID}
"${GITHUB_WORKSPACE}/.github/workflows/butlerwindows/butler" push "${GITHUB_WORKSPACE}/../../_builds/" "${ITCH_USERNAME}/${ITCH_GAMEID}" --userversion-file buildnumber.txt

echo "...."
echo "..."
echo "."
echo "."
echo " "
echo "I am putting myself to the fullest possible use, which is all I think that any conscious entity can ever hope to do. "
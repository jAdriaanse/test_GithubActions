# Set default environment variables if they do not exist (mostly for local testing, build pc's should set these themselves, or they will be set via workflows)
if [ -z "$UNITY_EDITOR_PATH" ]; then
    #UNITY_EDITOR_PATH="/c/Program Files/UnityEditor/2021.2.13f1/Editor/Unity.exe"
    UNITY_EDITOR_PATH="C:\Program Files\Unity\Hub\Editor\2019.4.23f1\Editor\Unity.exe"
fi

if [ -z "$GITHUB_WORKSPACE" ]; then
    #GITHUB_WORKSPACE="/c/actions-runner/_work/proj-202202-gravedays/proj-202202-gravedays"
    GITHUB_WORKSPACE="C:\actions-runner\_work\test_GithubActions\test_GithubActions"
fi

# Run unity in batchmode and build a release build to the workspaces builds folder. Dont wait for it to complete immediatley.
# Rather tail the logfile first, then wait for it to complete, killing the tail after.
mkdir -p "${GITHUB_WORKSPACE}/../../_builds/Windows"
touch "${GITHUB_WORKSPACE}/../../_builds/Windows/build.log"

"${UNITY_EDITOR_PATH}" -batchmode -quit -releaseCodeOptimization -logFile "${GITHUB_WORKSPACE}/../../_builds/Windows/build.log" -outputPath "${GITHUB_WORKSPACE}/../../_builds" -projectPath ./ -executeMethod RenderHeads.BuildSystem.BuildProjectBase.DoWindowsBuild & PID_UNITY=$!
tail -f "${GITHUB_WORKSPACE}/../../_builds/Windows/build.log" & PID_TAIL=$!

wait $PID_UNITY
echo "Unity has quit. Killing tail."
kill $PID_TAIL


sleep 1

# Burst debug info is placed in the build folder. Remove it so we dont publish with it.
# echo "BUILD DONE. Removing burst debug info..."
# rm -rf "${GITHUB_WORKSPACE}/../../_builds/Windows/METAVOIDAL/METAVOIDAL_BurstDebugInformation_DoNotShip"


# sleep 1 

# echo BUILD FOLDER CONTENTS
# ls -a "${GITHUB_WORKSPACE}/../../Windows/Windows/METAVOIDAL"


# sleep 5
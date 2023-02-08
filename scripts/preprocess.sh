#!/usr/bin/env bash

RELEASE_FILTER_RE="release-(0|[1-9]\d*)\.(0|[1-9]\d*)$"

OUTPUT_CONTENT_DIR="content-pre-processed"
OUTPUT_CONTENT_EN_DIR="${OUTPUT_CONTENT_DIR}/content"
OUTPUT_CONTENT_ZH_DIR="${OUTPUT_CONTENT_DIR}/content.zh"

rm -rf "${OUTPUT_CONTENT_DIR}"
mkdir -p "${OUTPUT_CONTENT_EN_DIR}" "${OUTPUT_CONTENT_ZH_DIR}"

git remote -v
git fetch origin
RELEASE_BRANCHES=$(git branch --all | grep -P "remotes/origin/${RELEASE_FILTER_RE}" | egrep --invert-match '(:?HEAD|main)$' | sort -V)
echo ">> chosen $(echo ${RELEASE_BRANCHES}) releases to deploy docs from"

# for current branch as latest
ln -r -s content ${OUTPUT_CONTENT_EN_DIR}/latest
ln -r -s content.zh ${OUTPUT_CONTENT_ZH_DIR}/latest

#
for branchRef in ${RELEASE_BRANCHES}; do
  branchName=${branchRef##*/}
  export tags=${branchName/release-/}
  echo ">> cloning docs for versioning ${tags}"
  mkdir -p "${OUTPUT_CONTENT_DIR}/${tags}" "${OUTPUT_CONTENT_EN_DIR}/${tags}" "${OUTPUT_CONTENT_ZH_DIR}/${tags}"
  git archive --format=tar "refs/${branchRef}" | tar -C${OUTPUT_CONTENT_DIR}/${tags} -x "content/" -x "content.zh/" --strip-components=0
  mv ${OUTPUT_CONTENT_DIR}/${tags}/content/* ${OUTPUT_CONTENT_EN_DIR}/${tags}/
  mv ${OUTPUT_CONTENT_DIR}/${tags}/content.zh/* ${OUTPUT_CONTENT_ZH_DIR}/${tags}/
  rm -r ${OUTPUT_CONTENT_DIR}/${tags}
done
#!/bin/bash

# get path of script location
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [[ $# -ne 2 ]]; then
	echo "usage: $0 ROOT_OF_ALL_REPOS DESTINATION_FOLDER"
	exit 1
fi

SOURCE_FOLDER=$1
DESTINATION_FOLDER=$2

# clean destination folder
rm -rf ${DESTINATION_FOLDER}
mkdir -p ${DESTINATION_FOLDER}

# prepare header of index.html
INDEX=${DESTINATION_FOLDER}/index.html
printf '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">\n' >> ${INDEX}
printf "<html><head><title>GIT Archives</title></head>\n" >> ${INDEX}
printf "<h3>GIT Archives</h3><body><ul>\n" >> ${INDEX}
printf "\n" >> ${INDEX}

# iterate over all git remote folders
for project in ${SOURCE_FOLDER}/*.git
do
	# extract file name without path
	PROJECT_FOLDER=${project##*/}

	# notify processed project
	PROJECT_NAME=${PROJECT_FOLDER%.*}
	ARCHIVE_FILE=${PROJECT_NAME}.zip
	echo "  ${project}"

	# create archive
	git archive --remote ${project} master -o ${DESTINATION_FOLDER}/${ARCHIVE_FILE}

	# insert entry in index file
	printf "<li><a href="${ARCHIVE_FILE}">${PROJECT_NAME}</a></li>\n" >> ${INDEX}

done

# finalize index.html
printf "</ul></body></html>\n" >> ${INDEX}

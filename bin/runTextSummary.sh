#!/bin/bash -x

env

echo "PYTHON_DATA=${PYTHON_DATA}"
data_files=`ls $PYTHON_DATA`

pip install -r ${PYTHON_MAIN}/requirements.txt
for program in `ls $PYTHON_MAIN/*.py`; do
    echo "=================================="
    echo "... Running Summarizer Python main: $program"
    for data in $data_files; do
        echo "----------------------------------"
        echo "... Summarizing data file: ${data}"
        /usr/bin/python3 ${program} -d ${data}
    done
done
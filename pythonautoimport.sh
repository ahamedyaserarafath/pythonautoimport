#!/bin/bash
python3 -m venv virutal_env_autoimport
source virutal_env_autoimport/bin/activate
just_import=$(grep -ir "import" . | grep -v "virutal_env_autoimport" | grep  "\.py" | grep -v "from" | grep -v "#" | grep -v "print" | awk '{print $2}')
IFS=$'\n'       # make newlines the only separator
for j in $just_import    
do
    echo "pip install $j"
    pip install $j
done

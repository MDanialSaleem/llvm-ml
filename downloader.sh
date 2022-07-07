DUMP_DIR=repos
mkdir -p $DUMP_DIR
cat repos.txt | while read line 
do
    # remove trailing / from the url.
    name=$(awk -F/ '{print $NF}' <<< $line)
    if [ -d "$DUMP_DIR/$name" ]; then
        echo "repository $name exists continuing"
    else
        echo "repository $name does not exist, cloning"
        git clone $line $DUMP_DIR/$name --depth=1
    fi
done

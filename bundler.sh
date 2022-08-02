BUILD_DIR=./build

sum=$(( 0 ))
for i in $(find $BUILD_DIR -type f);
do
    lc=`wc -l < $i`
    sum=$(( sum + lc ))
done;

echo $sum

COMPILED_FILE="compiled.txt"
touch $COMPILED_FILE
> $COMPILED_FILE

for i in $(find $BUILD_DIR -type f);
do
    cat < $i >> $COMPILED_FILE
done;


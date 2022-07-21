DUMP_DIR=repos
COMPILED_DIR=$PWD/build
mkdir -p $COMPILED_DIR
cd $DUMP_DIR
for dir in */ 
do 
    cd $dir
    dirname=${dir%*/}
    THIS_COMPILED_DIR=$COMPILED_DIR/$dirname
    if [ -d "$THIS_COMPILED_DIR" ]; then
        echo "already compiled $dirname continuing"
    else
        echo "compiling $dirname"
        mkdir -p $THIS_COMPILED_DIR
        cargo clean
        cargo rustc --lib --release -- --emit=llvm-ir
        ret=$?
        if [ $ret -ne 0 ]; then
            rm -rf $THIS_COMPILED_DIR
        fi
        mv target/release/deps/*.ll $THIS_COMPILED_DIR
    fi
    cd ..
done
apt-get update
apt-get install screen
apt-get install git
apt-get install python3
apt-get install python3-pip
pip install gdown
gdown --id 1Flqy4Mejw9hT5YIOEyGuQdejiJ_WgxJV
wc -l nameoffile
head -n file > training
cat million.txt | tail -n > testing
head -10 testfile.txt | tail -1

python3 bertWorkingDir2/transformers/examples/pytorch/language-modeling/run_mlm.py --model_name_or_path distilroberta-base --train_file bertWorkingDir/data/train-norm.txt --validation_file bertWorkingDir/data/test-norm.txt --per_device_train_batch_size 8 --per_device_eval_batch_size 8 --do_train --do_eval --output_dir /tmp/danial-norm

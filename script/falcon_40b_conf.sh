#!/bin/bash
#SBATCH --job-name=falcon_40b
#SBATCH --output=./stdout/slurm-%j.out
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=200G
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=4

#SBATCH --gres=gpu:4
#SBATCH -p gpu
#SBATCH --qos=gpu-8

cd /l/users/haonan.li/mygit/CMMLU/src

for i in {0..1}; do
python gpt_model.py \
    --model_name_or_path tiiuae/falcon-40b \
    --save_dir ../results/Falcon-40B-conf \
    --load_in_8bit \
    --with_conf \
    --num_few_shot $i
done


model_location := '/opt/models'
data_location := '/opt/data'

_default:
    @just --list

_main *ARGS:
    CUDA_VISIBLE_DEVICES=0 python3 main.py --data-location {{data_location}} --model-location {{model_location}} {{ARGS}} --workers `nproc`

eval_individual_models:
    @just _main --eval-individual-models

uniform_soup:
    @just _main --uniform-soup

greedy_soup:
    @just _main --greedy-soup

plot:
    python3 main.py --plot

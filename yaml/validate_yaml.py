# script to validate yaml file
# pip install pyyaml

import yaml

with open('YAML.yml', 'r') as file:
    try:
        print(yaml.safe_load(file))
    except yaml.YAMLError as exc:
        print(exc)
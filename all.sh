mkdir output;
aws iam list-users |  jq '.Users[].UserName' | xargs -I% sh -c 'USERNAME=% sh one.sh | tee ./output/%.txt'

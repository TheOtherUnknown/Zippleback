#!/bin/bash
json="$(curl -m 5 -s https://barfandbel.ch/api/v2/quote.php)"
if [ $? -gt 0 ]; then
  echo 'Failed to get quote from remote server!'
  exit 1
else
  command -v jq > /dev/null
  if [ $? -eq 0 ]; then # Is the JQ binary present? https://stedolan.github.io/jq/tutorial/
    echo "$(echo $json | jq '.quote')" # I guess that's how you do that
    echo "   - $(echo $json | jq '.character' | tr -d '"'), $(echo $json | jq '.source' | tr -d '"')" # tr removes all double quotes
  else #No jq? Then we'll use Python to parse the JSON
    echo "\"$(echo $json | python3 -c "import sys, json; print(json.load(sys.stdin)['quote'])")\""
    # I am mildy ashamed of this next line
    echo "   - $(echo $json | python3 -c "import sys, json; j=json.load(sys.stdin); print(j['character'] + ', ' + j['source'])")"
  fi 
fi

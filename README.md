# Zippleback
Zippleback is a Bash command line client for the [BarfAndBel.ch API](https://barfandbel.ch/p/api/).

It uses [jq](https://stedolan.github.io/jq/) or Python 3 to parse the JSON from the API, in that order.
## How to use Zippleback as your server MOTD
### Debian/Ubuntu users
Copy the script file to `/etc/update-motd.d` and `chmod +x`. You may need to rename the file to add the run priority to the beginning. 
### Others
Try putting the script in `/etc/profile.d`.
## Acknowledgements 
Thanks to Iantje for providing the world's primier DaaS (Dragons-as-a-service) API.
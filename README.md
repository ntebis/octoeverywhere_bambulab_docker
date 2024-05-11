# octoeverywhere_bambulab_docker

Unofficial docker container for Bambulab Octoeverywhere. Still some work in progress. Please report any bugs in the issue tracker. 

Features request will not be done as [Quinn Damerell](https://github.com/QuinnDamerell) of Octoeverywhere will be creating an official container at some point. Please direct your feature requests there. 

## How to use
Edit docker compose file with the appropriate info and then run `docker-compose -f docker-compose.yml up`.

Click the link from the logs to verify connection

## Limitations
If the container gets deleted, you will have to re register the printer and it will show up as a new printer in Octoeverywhere. You can delete old printer registrations by click the `Account` button on the top right.

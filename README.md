First, add the group names that you want to dump to config.yaml.

Build the image with:

    docker build -t telegram .

You can run the container with:

    docker run -ti --rm -v $(pwd)/output:/root/output telegram bash

(Don't forget to create the output folder, so you can access the dump inside the volume)

While inside the shell, run telegram-cli first without the daemon so you can authenticate against the telegram servers.

After that, you can daemonize with:

    ./tg/bin/telegram-cli --json -P 9009 -d &

With that on the background, run the dumper with:

    ./telegram-history-dump/telegram-history-dump.rb -c ./telegram-history-dump/config.yaml 

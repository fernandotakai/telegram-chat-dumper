First, add the group names that you want to dump to config.yaml.

Build the image with:

    docker build -t telegram .

After that, you can run with:

    docker run -ti --rm -v $(pwd)/output:/root/output telegram bash

While inside the shell, run telegram-cli first without the daemon so you can authenticate against the telegram servers.

After that, you can daemonize with:

    ./tg/bin/telegram-cli --json -P 9009 -d &

With that on the background, run the dumper with:

   ./telegram-history-dump/telegram-history-dump.rb -c ./telegram-history-dump/config.yaml 

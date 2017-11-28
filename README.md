# How do I build this?

```bash
  docker build -t centos .
  docker run -it -p 6222:6222 centos bash
```

# How do I use it?

Run a test suite w/ headless chrome using these args
```bash
npm i -g ember-cli
ember new <name-of-project>
```

```bash
<name-of-project>/testem.js

  launch_in_dev: [
    'Chrome'
  ],
  browser_args: {
    Chrome: {
-     mode: 'ci',
+     mode: 'dev',
      args: [
        '--disable-gpu',
        '--headless',
+       '--no-sandbox',
        '--remote-debugging-port=9222',
        '--window-size=1440,900'
      ]
    },
  }
```


# How do I remotely debug?

With headless chrome running forward 6222 => 9222

`socat -v -d tcp-listen:6222,reuseaddr,fork tcp:localhost:9222 &`

Start test server

`ember test --server`

Visit chrome from the developer machine

  `http://127.0.0.1:6222`

# How do I kill docker?

stop all containers:

`docker kill $(docker ps -q)`

remove all containers.

`docker rm $(docker ps -a -q)`

remove all docker images.

`docker rmi $(docker images -q)`


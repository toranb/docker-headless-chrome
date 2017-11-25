# How do I build this?

```bash
  docker build -t centos .
  docker run -it -p 6222:6222 centos bash
```

# How do I use it?

Run a test suite w/ headless chrome using these args

```bash
  args: [
    '--disable-gpu',
    '--headless',
    '--no-sandbox',
    '--remote-debugging-port=9222',
    '--window-size=1440,900'
  ]
```

# How do I remotely debug?

With headless chrome running forward 6222 => 9222

  `socat -v -d tcp-listen:6222,reuseaddr,fork tcp:localhost:9222`

Visit chrome from the developer machine

  `http://127.0.0.1:6222`

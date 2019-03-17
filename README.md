## SetUp
### Install [sqitch](https://sqitch.org/)
```
$ aptitude install sqitch
```

### Configure sqitch
```
$ sqitch config --user user.name "Name"
$ sqitch config --user user.email "email"
$ sqitch config --bool deploy.verify true
$ sqitch config --bool rebase.verify true 
```

### Create DB
```
$ createdb -U root flipr
```

### Add target to ~/.sqitch/sqitch.conf
```
[target "flipr"]
    uri = db:pg://user:pass@localhost/flipr
```

### Install deps in bin
```
$ ./install.sh
```

## Use sqitch

### Check status
```
$ sqitch status flipr
```

### Deploy
```
$ sqitch deploy flipr
```

## Test
```
$ ./test.sh
```

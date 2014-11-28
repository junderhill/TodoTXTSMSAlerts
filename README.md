#TODO SMS Alerts

To configure run the following to set the environment variables..

```
export SMSAPI=abcd1234abcd1234abcd
export MOBILENO=01234567890
export TODOTXT=/path/to/todo.txt
```

Then add the script to a cron job. I have mine set to 5 minute intervals this means any 5 min interval time will send an alert (Eg. 10:05, 10:35, 10:55 etc..)

# Log Stats
This app parses server logs and provides below statistics in descending order
- Most Popular pages 
- Most Unique visits page views

## installation

``` bundle install ```

## perform queries
In order to perform queries, run the below command

``` bin/parser.rb <logfile path> ```
default option for query is `popular`
``` 
example: 
        bin/parser.rb spec/fixtures/webserver_original.log -q'unique'
         bin/parser.rb spec/fixtures/webserver_original.log -q'popular'
```

## tests & coverage
current coverage stand at `100%`

```
rspec .
```

## style check
### rubocop
```
rubocop . 
```
### reek
```
reek .
```


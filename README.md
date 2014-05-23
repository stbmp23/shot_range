# ShotRange

Simple profiler for rails.

## Instllation

```
git clone https://github.com/stbmp23/shot_range
cd shot_range
rake install
```

### Fluentd

shot_range logger use fluentd. add match pattern to your fluentd configuration file.

```
<match shot_range.**>
  type stdout
</match>
```

### Output

Default output is RAILS_ROOT/log/shot_range.log, if want to use fluentd, add this code to config/application.rb

```
ShotRange.logger = :fluentd
```

or generate shot_range by rails generator.

```
rails g shot_range:install
```
  

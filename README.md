# Rovers

## Running tests

First, make sure you have Elixir available, then inside the project root just run:

```shellscript
mix deps.get
MIX_ENV=test mix espec
```

If you want a more verbose output:

```shellscript
MIX_ENV=test mix espec --format=doc
```

## Executing the samples

First, build the executable:

```shellscript
mix escript.build
```

Then, just run it passing the sample as the standard input:

```shellscript
./rovers < samples/sample_1.txt
```

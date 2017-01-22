# Rovers

## Running tests

First make sure you have Elixir installed then, inside the project root, just run:

```shellscript
mix deps.get
MIX_ENV=test mix espec
```

If you want a more verbose output:

```shellscript
MIX_ENV=test mix espec --format=doc
```

## Code style check

```shellscript
mix credo
```

## Usage

First, build the executable:

```shellscript
mix escript.build
```

Then, just run it passing the sample as the standard input:

```shellscript
./rovers < samples/sample_1.txt
```

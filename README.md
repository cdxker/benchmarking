# Benchmarking

I've had to make benchmarking scripts so so many times, I'm tired of this. Here's my benchmarking setup.

## Deps

- [wrk2]()
- [wrk2img]() for graph generation

## Usage

Commands
| Command name                              | Command Description |
|-------------------------------------------|--------------|
| ./bench.sh new <benchmark-dir>            | Create a new directory called <benchmark-dir> and places a script.lua for wrk2 |
| ./bench.sh graph <benchmark-dir>          | Runs wrk2img and makes a graph for based on all the graphs located in $benchmark-dir |
| ./bench.sh run <benchmark-dir> $route     | Runs a benchmark, with some default arguments, feel free to change. Auto prints output to `$benchmark-dir/output` **WILL OVERWRITE** |
| ./bench.sh show <benchmark-dir>           | Alias to `echo $benchmark-dir/output` |

I'm lazy, so I also aliased the first letter to be the same as the full name.

The following are all also valid syntax names

```
./bench.sh n <benchmark-dir>           
./bench.sh g <benchmark-dir>         
./bench.sh r <benchmark-dir> $route    
./bench.sh s <benchmark-dir>
```

There isn't much robust input validation, but there isn't many mistakes that can be made

### Make a benchmark

```sh
./bench n openai-gpt4o-test
```

### Edit the `script.lua` file

By default, its something like this.

```lua
wrk.method = "POST"
wrk.body   = '{ "model": "gpt-4o-mini", "messages": [ { "role": "system", "content": "You are a helpful assistant." }, { "role": "user", "content": "What is deep learning?" } ], "stream": true, "max_tokens": 20 }'
wrk.headers["Content-Type"] = "application/json"
wrk.headers["X-API-KEY"] = "sk-******************************"
```

### Run a Benchmark

```sh
./bench r openai-gpt4o-test https://api.openai.com/ https://api.openai.com/v1/chat/completions
```

### Make a graph of your results

```sh
./bench g openai-gpt4o-test
```

* not tested yet, should just use wrk2img though and auto work



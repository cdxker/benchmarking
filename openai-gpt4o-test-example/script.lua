wrk.method = "POST"
wrk.body   = '{ "model": "gpt-4o-mini", "messages": [ { "role": "system", "content": "You are a helpful assistant." }, { "role": "user", "content": "What is deep learning?" } ], "stream": true, "max_tokens": 20 }'
wrk.headers["Content-Type"] = "application/json"
wrk.headers["X-API-KEY"] = "sk-************************************************"

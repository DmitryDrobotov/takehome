## Up & Run

```
git clone ...
bundle
ruby app.rb -p 3000
curl localhost:3000
```

## Benchmark

Performing 100 sequential requests:

```
$ time for a in {1..100}; do curl -s localhost:3000 > /dev/null; done

real  1m3.458s
user  0m0.621s
sys 0m0.716s # in average: 0.635 s/req.
```

Which is `635 ms/req`. When 100 sequential request to the *original single* resource require:

```
$ time for a in {1..100}; do curl -s https://takehome.io/twitter > /dev/null; done

real  0m46.286s
user  0m1.812s
sys 0m0.930s
```

Which is `463 ms/req`. So, aggregation of 4 parallel requests with retries adds `172 ms` to the request in average.

## Results

Thank you for the test assignment! It was a pleasure to renew in mind some parts of Ruby which is not in use every day. There are a lot of things that can be improved still, but I am out of time already.

Things to improve:

1. File Structure
2. HTTP Errors Handling (your API didn't fail and always responded, but it should be covered FMPOV)
3. As an option, put parallel execution into a separate class
4. Cover with specs

Thoughts:

There was no need to use Rails for so single-responsibility service, so I selected Sinatra as the most comfortable and compact solution FMPOV.

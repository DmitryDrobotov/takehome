# !/bin/bash

time for a in {1..100}; do curl -s localhost:3000 > /dev/null; done

time for a in {1..100}; do curl -s https://takehome.io/twitter > /dev/null; done

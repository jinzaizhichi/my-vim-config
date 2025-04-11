#!bin/bash

easy_pull_request() {
  gh pr create --base main --fill && gh pr merge --merge
}

easy_pull_request

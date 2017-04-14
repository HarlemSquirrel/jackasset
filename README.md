# jackasset

A Ruby CLI for checking local static site assets.

## Installation

```sh
gem install jackasset
```

## Usage

```sh
jackasset [-p PORT] path/to/html_files
```

```sh
$ jackasset path/to/html_files
  200 OK http://localhost:8080/images/posts/deciphering-metrics/turbulence-d401c085.jpg
  404 Not Found http://localhost:8080//platform.twitter.com/widgets.js
  404 Not Found https://google.com/assets/cheese.png
Finished checking 3 URLs and found 2 issues
```

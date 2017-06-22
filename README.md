# hugo-scripts

Helpful scripts for Hugo

## Directories

* *bin/*      - these helpful scripts
* *src/*      - your hugo site source
* *release/*  - packaged site destination

## Scripts

### bin/create-blog.sh

Usage: _bin/create-blog.sh [-d YYYYMMDD] <filename.md>_

Creates a new empty draft blog post and related static content directory. Defaults to current date if not specified.
* content/blog/YYYYMMDD/filename.md
* static/blog/YYYYMMDD/

### bin/package-site.sh

Usage: _bin/package-site.sh_

Regenerate content in src/public, packaging as a gzipped tar archive.

### bin/deploy-site.sh

Usage: _bin/deploy-site.sh <file.tar.gz>_

Deploy a gzipped archive contents to a specified directory.

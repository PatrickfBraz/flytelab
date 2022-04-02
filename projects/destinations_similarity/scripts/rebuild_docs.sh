#!/bin/bash
docker stop sphinx-nginx
docker run --rm --name build-docs -it -v $(pwd):/home/ sphinx-server
docker run --rm --name sphinx-nginx -v $(pwd)/_build/:/usr/share/nginx/html:ro -d -p 8080:80 nginx
echo "Sphinx docs is hosted at: http://localhost:8080/"
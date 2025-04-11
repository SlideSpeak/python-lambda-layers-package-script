#!/bin/bash

export PKG_DIR="python"

rm -rf ${PKG_DIR} && mkdir -p ${PKG_DIR}

# Use the Amazon Linux 2 container that matches Lambda's environment
docker run --rm --platform linux/amd64 -v $(pwd):/var/task amazonlinux:2023 /bin/bash -c "
    # Install Python 3.12 (comes with Amazon Linux 2023)
    dnf install -y python3.12 python3.12-pip python3.12-devel gcc libxml2-devel libxslt-devel
    
    # Verify Python version and SSL support
    python3.12 --version
    python3.12 -c 'import ssl; print(\"SSL available\")'
    
    # Install packages
    python3.12 -m pip install -r /var/task/requirements.txt -t /var/task/${PKG_DIR}
    
    # List installed packages
    ls -la /var/task/${PKG_DIR}
"

zip -r ./lambda_layer.zip ${PKG_DIR}

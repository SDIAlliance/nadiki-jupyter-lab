#!/bin/sh

# we do this here instead of the Dockerfile because the home directory
# might be a mounted EFS volume
if [ ! -f /home/jupyterlab/.jupyter/jupyter_server_config.py ] ; then
    jupyter server --generate-config
fi

if [ -n "$TLS_CERTIFICATE_PATH" ]; then
    jupyter-lab --ip 0.0.0.0 --no-browser --certfile="$TLS_CERTIFICATE_PATH" --keyfile="$TLS_KEY_PATH"
else
    jupyter-lab --ip 0.0.0.0 --no-browser
fi

FROM jupyter/base-notebook:python-3.9
USER root

RUN apt-get -y update
RUN apt-get -y install \
    git \
    build-essential \
    net-tools


# Copy over custom live preview script
COPY live-preview.sh /usr/local/bin/livepreview
RUN chmod a+x /usr/local/bin/livepreview

USER ${NB_USER}

# Install from requirements.tfxt file
COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/
RUN pip install --quiet --no-cache-dir --requirement /tmp/requirements.txt

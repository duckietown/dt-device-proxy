# parameters
ARG REPO_NAME="dt-device-proxy"
ARG MAINTAINER="Jesus Duran (jduran@ttic.edu)"

# ==================================================>
# ==> Do not change the code below this line
ARG ARCH=arm32v7
ARG DISTRO=daffy
ARG BASE_TAG=1.17.0
ARG BASE_IMAGE=nginx

# define base image
FROM ${ARCH}/${BASE_IMAGE}:${BASE_TAG}

# recall all arguments
ARG ARCH
ARG DISTRO
ARG REPO_NAME
ARG MAINTAINER
ARG BASE_TAG
ARG BASE_IMAGE

# define/create repository path
ARG REPO_PATH="${SOURCE_DIR}/${REPO_NAME}"
ARG LAUNCH_PATH="${LAUNCH_DIR}/${REPO_NAME}"
RUN mkdir -p "${REPO_PATH}"
RUN mkdir -p "${LAUNCH_PATH}"
WORKDIR "${REPO_PATH}"

# keep some arguments as environment variables
ENV DT_MODULE_TYPE "${REPO_NAME}"
ENV DT_MAINTAINER "${MAINTAINER}"
ENV DT_REPO_PATH "${REPO_PATH}"
ENV DT_LAUNCH_PATH "${LAUNCH_PATH}"

# copy QEMU
COPY ./assets/qemu/${ARCH}/ /usr/bin/

# apply custom configuration
COPY assets/proxy.conf /etc/nginx/conf.d/default.conf

# store module metadata
LABEL org.duckietown.label.module.type="${REPO_NAME}" \
    org.duckietown.label.architecture="${ARCH}" \
    org.duckietown.label.code.location="${REPO_PATH}" \
    org.duckietown.label.code.version.distro="${DISTRO}" \
    org.duckietown.label.base.image="${BASE_IMAGE}" \
    org.duckietown.label.base.tag="${BASE_TAG}" \
    org.duckietown.label.maintainer="${MAINTAINER}"
# <== Do not change the code above this line
# <==================================================

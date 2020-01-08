# parameters
ARG REPO_NAME="dt-http-proxy"

ARG ARCH=arm32v7
ARG MAJOR=ente
ARG BASE_TAG=alpine
ARG BASE_IMAGE=nginx

# define base image
FROM ${BASE_IMAGE}:${BASE_TAG}

# clear ngingx configuration
RUN rm /etc/nginx/conf.d/default.conf

# apply custom configuration
COPY proxy.conf /etc/nginx/conf.d/proxy.conf

# store module name
LABEL org.duckietown.label.module.type "${REPO_NAME}"
ENV DT_MODULE_TYPE "${REPO_NAME}"

# store module metadata
ARG ARCH
ARG MAJOR
ARG BASE_TAG
ARG BASE_IMAGE
LABEL org.duckietown.label.architecture "${ARCH}"
LABEL org.duckietown.label.code.location "${REPO_PATH}"
LABEL org.duckietown.label.code.version.major "${MAJOR}"
LABEL org.duckietown.label.base.image "${BASE_IMAGE}:${BASE_TAG}"

# define maintainer
LABEL maintainer="Jesus Duran (jduran@ttic.edu)"

FROM alpine:latest
ARG TERRAFORM_VER="0.12.20"
ARG PYTHON_VER="3.8"
RUN apk update && apk add --no-cache \
  
  && apk add python3 \
  && apk add py3-pip \
 
  && apk add aws-cli \
  
  && apk add nano wget unzip \
  
  && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VER}_linux_amd64.zip \
  && mv terraform /usr/local/bin/ \
  && rm terraform_${TERRAFORM_VER}_linux_amd64.zip \
  
  && apk add curl nodejs npm git bash

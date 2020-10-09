FROM alpine:latest
ARG TERRAFORM_VER="0.13.2"
ARG PYTHON_VER="3.8"
RUN apk update && apk add --no-cache \
  
  && apk add python3 \
  && apk add py3-pip \
 
  && apk add aws-cli \
  
  && apk add nano wget unzip openssh \
  
  && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VER}_linux_amd64.zip \
  && mv terraform /usr/local/bin/ \
  && rm terraform_${TERRAFORM_VER}_linux_amd64.zip \
  
  && apk add curl nodejs npm git gnupg bash \
  
  && mkdir /tfenv && \
    git clone https://github.com/tfutils/tfenv.git /tfenv && \
    cd /tfenv && \
    git checkout v1.0.1 && \
    ln -s /tfenv/bin/tfenv /bin/tfenv && \
    ln -s /tfenv/bin/terraform /bin/terraform && \
    echo 'trust-tfenv: yes' > /tfenv/use-gpgv && \
	  tfenv install 0.11.14 && \
	  tfenv install 0.13.2 && \
    tfenv install 0.12.20 && \
	  tfenv use 0.12.20

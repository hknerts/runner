# Use the latest stable Alpine Linux as the base image
FROM alpine:3.22.0

# Install necessary system packages and development tools
# - python3, pip for Python-based tools and scripts
# - aws-cli for AWS interaction
# - go for Go language support
# - nodejs, npm for Node.js and JavaScript tools
# - git for version control
# - Other utilities: wget, unzip, jq, curl, bash, gnupg
# Update apk cache, install packages, then clean up cache to minimize layer size
RUN set -euxo pipefail && \
    apk update && \
    apk add --no-cache \
        python3==3.12.10-r1 \
        py3-pip==25.1.1-r0 \
        aws-cli==2.27.25-r0 \
        go==1.24.3-r1 \
        nodejs==22.16.0-r2 \
        npm=11.3.0-r0 \
        git==2.49.0-r0 \
        wget \
        unzip \
        jq \
        curl \
        bash \
        gnupg && \
    rm -rf /var/cache/apk/*

# Install kops and kubectl
RUN set -euxo pipefail && \
    # Install kops (latest version)
    curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64 && \
    chmod +x kops-linux-amd64 && \
    mv kops-linux-amd64 /usr/local/bin/kops && \
    # Install kubectl (latest stable version)
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/kubectl

# Install tfenv and set the desired Terraform version
RUN set -euxo pipefail && \
    git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv && \
    ln -s ~/.tfenv/bin/* /usr/local/bin && \
    tfenv install 1.12.1 && \
    tfenv use 1.12.1
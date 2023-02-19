FROM alpine:3.17.2
RUN apk update && apk add --no-cache \
  && apk add python3==3.10.10-r0 \
  && apk add py3-pip==22.3.1-r1 \
  && apk add aws-cli==1.25.97-r0 \
  && apk add go==1.19.6-r0 nodejs==18.14.1-r0 npm=9.1.2-r0 git==2.38.4-r0  \
  && apk add wget unzip jq curl bash gnupg \
  && curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64 \
  && chmod +x kops-linux-amd64 \
  && mv kops-linux-amd64 /usr/local/bin/kops \
  && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
  && chmod +x kubectl \
  && mv kubectl /usr/local/bin/ \
  && curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash \
  && tfswitch 1.3.9
# 
# Portefaix base image.
#

FROM alpine:3.1
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Install base packages
RUN apk update && apk upgrade && \
    apk-install bash 

CMD ["/bin/bash"]

FROM ubuntu:16.04
MAINTAINER Cris Barbero
RUN apt-get update && apt-get install -y wget unzip make git

# Install terraform
RUN mkdir /usr/local/terraform \
  && wget https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_linux_amd64.zip -O terraform.zip \
  && unzip terraform.zip -d /usr/local/terraform \
  && rm terraform.zip
ENV PATH="/usr/local/terraform:${PATH}"

#include our aws credentials
ENV AWS_PROFILE="saml"

FROM ruby:latest

MAINTAINER Jeffer Lau "jefferlzu@gmail.com"

# Update aptitude with new repo
RUN apt-get update

# Install vim
RUN apt-get install -y vim --force-yes

# Install githug
RUN gem install githug


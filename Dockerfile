FROM alpine:latest
MAINTAINER ytnobody <ytnobody@gmail.com>

RUN apk update && apk add gcc g++ make git patch perl perl-dev curl wget
RUN apk add perl-net-ssleay perl-io-socket-ssl perl-libwww
RUN curl -L http://xrl.us/cpanm > /bin/cpanm && chmod +x /bin/cpanm
RUN cpanm App::cpm
RUN cpanm Net::Ping
RUN cpanm -n Net::SSLeay
RUN cpanm -n LWP::Simple
RUN cpanm -n LWP::Protocol::https
RUN cpanm -n JSON
RUN cpanm -n Net::DNS
RUN cpanm -n Email::Sender::Simple
RUN cpanm -n Email::Sender::Transport::SMTPS
RUN cpanm -n Email::Stuffer
RUN cpanm -n AnyEvent::RabbitMQ::Simple


WORKDIR /usr
RUN cpm install Plack

ENV PERL5LIB=/usr/local/lib/perl5
ENV PATH=/usr/local/bin:$PATH

WORKDIR /

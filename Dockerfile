FROM gcc:4.9
RUN curl -LO https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz && \
    tar -xvzf flex-2.6.4.tar.gz && \
    cd flex-2.6.4 && \
    ./configure && \
    make && \
    make install
RUN wget http://ftp.gnu.org/gnu/bison/bison-3.8.tar.gz && \
    tar -xvzf bison-3.8.tar.gz && \
    cd bison-3.8 && \
    ./configure && \
    make && \
    make install
WORKDIR /cable
COPY . .
RUN make all OS=nox
CMD ["cli/cable"]
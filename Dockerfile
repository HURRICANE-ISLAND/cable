FROM gcc:4.9
WORKDIR /cable
COPY . .
RUN apt-get install libxaw7-dev
RUN make
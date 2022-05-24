FROM golang as builder

ADD . /src
WORKDIR /src
RUN ENABLE_CGO=1 go build main.go

FROM ubuntu
COPY --from=builder /src/main /application
CMD ["/application"]
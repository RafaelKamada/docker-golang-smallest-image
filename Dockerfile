FROM golang:alpine as builder

WORKDIR $GOPATH/src/smallest-golang/app/

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /main .

FROM scratch

COPY --from=builder /main .

CMD ["./main"]
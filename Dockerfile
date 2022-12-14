# 打包阶段
FROM golang:1.19.3-alpine as stage

ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn,direct

WORKDIR /go/src/github.com/xm-tech/hello/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /out/main *.go


# 运行阶段
FROM scratch
COPY --from=stage /out/main /main
CMD ["./main"]

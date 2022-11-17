# 打包阶段
FROM golang1.19.1 as stage

ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn,direct

WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /out/main


# 运行阶段
FROM scratch
COPY --from=stage /out/main /main
CMD ["./main"]

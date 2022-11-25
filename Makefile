all:
	rm -f go.mod
	go mod init github.com/xm-tech/hello
	docker build -t go/hello:1.0.8 .
	# ./build hello 1.0.8
run:
	docker run go/hello:1.0.8


app_name = hello
version = 1.0.0
image_name = go/$(app_name):$(version)
mod_name = github.com/xm-tech/$(app_name)

all:
	rm -f go.mod
	go mod init $(mod_name)
	docker build -t $(image_name) .
run:
	docker run $(image_name)

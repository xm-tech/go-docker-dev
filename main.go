package main

import (
	"fmt"
	"os"
	"os/signal"
)

func main() {
	go sigalHandler()
	go func() {
		fmt.Println("hello golang")
		fmt.Println("hello docker")
		fmt.Println("hello golang & docker")
		// time.Sleep(time.Minute * 5)
	}()
	select {}
}

func sigalHandler() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, os.Interrupt)
	for {
		<-ch
		fmt.Println("os Interrupt")
		os.Exit(0)
	}
}

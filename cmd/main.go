package main

import (
	"fmt"
	"log"

	"github.com/jubelahmed/pkg/apiserver"
)

func main() {
	fmt.Println("Hello World New")
	config := apiserver.NewConfig()

	s := apiserver.New(config)

	if err := s.Start(); err != nil {
		log.Fatal(err)
	}
}

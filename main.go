// https://tonyuk.medium.com/how-to-build-a-ci-cd-pipeline-with-go-github-actions-and-docker-3c69e50b6043

package main

import "fmt"

var version = "dev"

func main() {
	fmt.Printf("Version: %s\n", version)
	fmt.Println(hello())
}

func hello() string {
	return "Hello World"
}

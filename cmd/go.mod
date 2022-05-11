module github.com/jubelahmed/apidemo

go 1.17

replace github.com/jubelahmed/pkg/apiserver => ../pkg/apiserver

require github.com/jubelahmed/pkg/apiserver v0.0.0-00010101000000-000000000000

require github.com/gorilla/mux v1.8.0 // indirect

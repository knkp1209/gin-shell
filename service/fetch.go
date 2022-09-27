package service

import (
	"fmt"
	"os"
	"os/exec"
	"syscall"
)

func Fetch() (string, error) {
	root, _ := os.Getwd()
	shellPath := root + "/shell/fetch.sh"
	command := exec.Command(shellPath) //初始化Cmd
	buf, err := command.Output()
	if err != nil {
		if exitErr, ok := err.(*exec.ExitError); ok {
			status := exitErr.Sys().(syscall.WaitStatus)
			switch {
			case status.Exited():
				fmt.Printf("Return exit error: exit code=%d\n", status.ExitStatus())
			case status.Signaled():
				fmt.Printf("Return exit error: signal code=%d\n", status.Signal())
			}
		} else {
			fmt.Printf("Return other error: %s\n", err)
		}
		return "", err
	} else {
		return string(buf), nil
	}
}

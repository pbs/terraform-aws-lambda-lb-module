package test

import (
	"archive/zip"
	"fmt"
	"io"
	"os"
	"testing"

	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/cloudwatchlogs"
)

func packageLambda(t *testing.T, variant string) {
	terraformDir := fmt.Sprintf("../examples/%s", variant)

	handlerLocation := fmt.Sprintf("%s/src/main.py", terraformDir)
	zipLocation := fmt.Sprintf("%s/artifacts/deploy.zip", terraformDir)

	file, err := os.Create(zipLocation)
	if err != nil {
		t.Fatal(err)
	}
	defer file.Close()

	wr := zip.NewWriter(file)
	defer wr.Close()

	handlerFile, err := os.Open(handlerLocation)
	if err != nil {
		t.Fatal(err)
	}
	defer handlerFile.Close()

	wHandler, err := wr.Create("main.py")
	if err != nil {
		t.Fatal(err)
	}
	io.Copy(wHandler, handlerFile)
}

func deleteLogGroup(t *testing.T, logGroupName string) {
	session, err := session.NewSession()
	if err != nil {
		t.Fatalf("Failed to create AWS session: %v", err)
	}
	svc := cloudwatchlogs.New(session)
	input := cloudwatchlogs.DeleteLogGroupInput{
		LogGroupName: &logGroupName,
	}
	_, err = svc.DeleteLogGroup(&input)
	if err != nil {
		t.Logf("Failed to delete log group: %v.\nThis is probably OK, as we're just making sure it's not there.", err)
	}
}

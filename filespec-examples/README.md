# JFrog File Specs

## Introduction

File Specs can be used to specify the details of files you want to upload or download to or from Artifactory. They are specified in JSON format and are currently supported in JFrog CLI, Jenkins Artifactory Plug-in, TeamCity Artifactory Plug-in, and Bamboo Artifactory Plug-in.

Read more about JFrog File specs here:
https://www.jfrog.com/confluence/display/JFROG/Using+File+Specs
https://www.jfrog.com/confluence/display/CLI/CLI+for+JFrog+Artifactory#CLIforJFrogArtifactory-UsingFileSpecs
https://jfrog.com/blog/use-file-specs-in-your-cicd-to-get-full-control-of-your-artifacts/

## Examples

The examples in this repository are meant to help you get started using JFrog File Specs.

Follow the below steps to run the examples using the JFrog CLI:

### Step 1 - Download and install JFrog CLI

Click [here](https://jfrog.com/getcli) to download and install JFrog CLI using your favorite package manager:

### Step 2 - Configure Artifactory Server for the Examples

To configure Artifactory server using the JFrog CLI, run the below command and follow the instructions.

```
jfrog config add
```

### Available Examples

|                                                       | Usage (`jfrog rt...`)                        | Explanation                                                                         |
| :---------------------------------------------------- | :------------------------------------------- | :---------------------------------------------------------------------------------- |
| [download](filespecs/download.json)                   | `dl --spec=filespecs/download.json`          | Downloads `generic-local/frog.txt` to `/tmp`                                        |
| [download-by-build](filespecs/download-by-build.json) | `dl --spec=filespecs/download-by-build.json` | Downloads all artifacts of build `froggy-build/1`                                   |
| [download-by-build](filespecs/download-by-props.json) | `dl --spec=filespecs/download-by-props.json` | Downloads all artifacts from `generic-local` repository which have key=val property |
| [upload-with-props](filespecs/upload-with-props.json) | `sp --spec=filespecs/upload-with-props.json` | Uploads `frog.txt` to `generic-local/` and set property key=val                     |
| [upload](filespecs/upload.json)                       | `u --spec=filespecs/upload.json`             | Uploads `frog.txt` to `generic-local/`                                              |

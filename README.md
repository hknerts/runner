# CI/CD Runner Image with Updated Tools (Alpine 3.22.0)

[![dockeri.co](https://dockeri.co/image/globalinfra/runner)](https://hub.docker.com/r/globalinfra/runner)
## Overview

This repository provides a Dockerfile to build a lightweight CI/CD runner image based on Alpine Linux. It comes pre-installed with a suite of essential development and infrastructure management tools, all updated to their recent stable versions. This image is ideal for use in CI/CD pipelines that require these tools for building, testing, and deploying applications.

## Installed Tools

This image includes the following tools with their respective versions:

*   **Base Image**: Alpine Linux `3.22.0`
*   **Python**: `3.12.10-r1`
*   **pip (for Python 3)**: `25.1.1-r0`
*   **AWS CLI**: `2.27.25-r0`
*   **Go**: `1.24.3-r1`
*   **Node.js**: `22.16.0-r2`
*   **npm**: `11.3.0-r0`
*   **Git**: `2.49.0-r0`
*   **kops**: `v1.32.0` (latest via GitHub releases at build time)
*   **kubectl**: `v1.31.0` (latest stable via Google Storage at build time)
*   **tfenv**: Latest version cloned from GitHub at build time
    *   **Terraform**: `1.12.1` (installed and set via `tfenv`)
*   **Other Utilities**: `wget`, `unzip`, `jq`, `curl`, `bash`, `gnupg` (latest available from Alpine 3.22 repositories at build time)

## How to Build

To build the Docker image locally, navigate to the repository root directory (where the `Dockerfile` is located) and run the following command:

```sh
docker build . -t cicd-runner:latest
```

You can replace `cicd-runner:latest` with your preferred image name and tag.

## How to Use

Once the image is built, you can run it interactively using:

```sh
docker run -it cicd-runner:latest bash
```

If you used a different image name or tag during the build step, replace `cicd-runner:latest` accordingly. This will start a bash session within the container, allowing you to use the installed tools.

For example, to check the version of a tool:
```sh
# Inside the container
python3 --version
aws --version
terraform --version
```

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue.

## License

This project is open source. Please refer to the `LICENSE` file if one exists in the repository, or assume a standard open-source license like MIT or Apache 2.0 if not specified. (Developer: Please add a `LICENSE` file if appropriate).

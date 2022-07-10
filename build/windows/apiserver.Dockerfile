ARG SERVERCORE_VERSION
ARG BINARY

FROM mcr.microsoft.com/windows/servercore:${SERVERCORE_VERSION}
SHELL ["powershell", "-NoLogo", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# PATH isn't actually set in the Docker image, so we have to set it from within the container
RUN $newPath =  ('C:/usr/local/bin/;{0}' -f $env:PATH); \
    Write-Host ('Updating PATH: {0}' -f $newPath); \
    Environment]::SetEnvironmentVariable('PATH', $newPath, [EnvironmentVariableTarget]::Machine);

COPY ${BINARY} C:/usr/local/bin/${BINARY}

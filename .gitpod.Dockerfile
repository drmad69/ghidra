FROM gitpod/workspace-full

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/
FROM gitpod/workspace-full

RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh \
             && sdk install java 12.0.1.j9-adpt \
             && sdk ..."
             
image:
  file: .gitpod.Dockerfile

tasks:
  - init: gradle build
tasks:
  - prebuild: mvn install spring-boot:start spring-boot:stop -DskipTests
    command: mvn spring-boot:run
ports:
  - port: 8080
    onOpen: open-preview
github:
  prebuilds:
    master: true


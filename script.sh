# Create a folder
mkdir actions-runner && cd actions-runner
# Download the latest runner package
curl -o actions-runner-linux-x64-2.281.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.281.1/actions-runner-linux-x64-2.281.1.tar.gz
# Optional: Validate the hash
echo "04f6c17235d4b29fc1392d5fae63919a96e7d903d67790f81cffdd69c58cb563  actions-runner-linux-x64-2.281.1.tar.gz" | shasum -a 256 -c
# Extract the installer
tar xzf ./actions-runner-linux-x64-2.281.1.tar.gz

# Create the runner and start the configuration experience
./config.sh --url https://github.com/McK-Internal/tooling-shared-ga --token AROVDMMLMDZIOOPKAMIPZKTBIOCNA
# Last step, run it!
./run.sh

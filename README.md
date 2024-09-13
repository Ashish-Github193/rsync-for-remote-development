# Rsync for Remote Development Project

Welcome to the Rsync for Remote Development Project! This is a comprehensive project designed to facilitate easier synchronization, bootstrapping, and management of remote development environments using rsync. Whether you're working with a remote server or a virtual environment hosted elsewhere, this little toolkit will make your development workflow smoother and more efficient.

## Overview

This project contains several scripts designed to aid with remote development:

- `sync.sh`: Synchronizes local changes to the remote environment.
- `boot.sh`: Initiates the remote environment, ensuring it's up and running.
- `kill.sh`: Gracefully terminates any running instances in the remote environment.

Each script is tailored to streamline specific parts of the remote development workflow.

## Getting Started

### Prerequisites

- You must have `rsync` installed on both your local machine and the remote server.
- SSH access to the remote server is required.
- Ensure that you have the necessary permissions to execute scripts on the remote server.

### Configuration

Before getting started, you'll need to configure the scripts to match your remote server's details. This involves setting up SSH keys (if not already done) and potentially modifying the scripts to point to the correct remote paths and server details.

### Usage

#### Syncing Files

To synchronize your local development files with the remote server, use the `sync.sh` script. You can manually run the script or run with `boot.sh` to ensure logs are generated.

1. Open your terminal.
2. Navigate to the project's directory.
3. Execute the script:
   ```
   ./sync.sh
   ```
4. Follow any on-screen instructions to complete the synchronization.

#### Killing the Remote Environment

When you're done with development, you might want to stop the running `sync.sh` process. To do this, use the `kill.sh` script. This will terminate the `rsync.sh` process and ensure that the remote environment is properly shut down.

1. Open your terminal.
2. Navigate to the project's directory.
3. Execute the script:
   ```
   ./kill.sh
   ```
4. The script will terminate all running instances related to your remote development environment.

### Behavior and Limitations

The `sync.sh` script is designed to synchronize files between your local machine and the remote server. It uses `rsync` to perform the synchronization, which means that it can handle a wide range of file types and configurations.

However, it's important to note that the synchronization process is not perfect and may encounter some limitations. Here are some things to keep in mind:

- The synchronization process may not well if you want to change the branch on the remote server to perform any changes or deployments. To do this, you'll need to kill the `sync.sh` process using the `kill.sh` script and then go to the remote server and manually update the branch and then perform anything you need to do.
- The while loop in the `sync.sh` script is designed to ensure that the synchronization process is running continuously. However, if you're experiencing high CPU usage or other issues, you may need to modify the script to sleep for a second or two before executing the next iteration. This will help prevent the synchronization process from running too quickly and potentially causing issues.
- Any changes made to the remote server will not be reflected in your local environment. Infact the script will detect any changes and will delete from the remote server to ensure synchronization is up to date. But this could be a double edged sword, as it could cause issues if you're not careful.
- To ensure files that are not supposed to be synchronized, you can add a .gitingore in your project's root directory. This will prevent rsync from synchronizing those files.

### Troubleshooting

- Ensure that your SSH keys are correctly set up and that the remote server can accept the connection.
- Verify that `rsync` is correctly installed and accessible in your system's PATH on both your local and remote machines.
- If a script fails to execute, check its permissions. You might need to make it executable by running `chmod +x script_name.sh`.

## Contributing

Your contributions are welcome! If you have suggestions or wish to improve the scripts, feel free to fork the repository and submit a pull request.

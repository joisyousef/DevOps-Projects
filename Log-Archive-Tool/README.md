# Log Archive Tool

This Log Archive Tool is a command-line utility to help keep log directories clean and organized. It compresses log files from a specified directory on a set schedule, saving disk space while preserving logs for future reference in a compressed format.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/log-archive-tool.git
   ```
2. Navigate to the project directory:
   ```bash
   cd log-archive-tool
   ```

### Usage

To run the tool, use the following command:

```bash
./log-archive.sh <log-directory>
```

#### Arguments:

- `<log-directory>`: The path to the directory containing the logs to be archived (e.g., `/var/log`).

### Example:

```bash
./log-archive.sh /var/log
```

This will compress all log files in the `/var/log` directory and store them in a new archive with a date-stamped filename in a directory named `archived_logs`.

## Output

- **Archive**: The script creates a `.tar.gz` archive named `logs_archive_YYYYMMDD_HHMMSS.tar.gz` in the `archived_logs` directory.
- **Log of Archives**: The script also records each archive creation date and time in a `archive_log.txt` file.

This project can be found on https://roadmap.sh/projects/github-actions-deployment-workflow

---

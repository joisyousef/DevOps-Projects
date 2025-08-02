---

# Log Analysis Tool

This tool analyzes an Nginx access log to provide insights into server requests. It identifies the top IP addresses, requested paths, response status codes, and user agents, making it easier to understand traffic patterns and monitor system usage.

## Usage

1. **Download or place the Nginx log file** (`nginx-access.log`) in the same directory as the script.
2. **Make the script executable**:
   ```bash
   chmod +x log-analysis.sh
   ```
3. **Run the script**:
   ```bash
   ./log-analysis.sh
   ```

## Example Output

```
Top 5 IP addresses with the most requests:
45.76.135.253 - 1000 requests
...

Top 5 most requested paths:
/api/v1/users - 1000 requests
...

```

```

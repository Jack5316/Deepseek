# DeepSeek CLI

A command-line interface for interacting with the DeepSeek API, allowing you to ask questions or perform searches directly from your terminal.

## Features

- Simple command-line interface for DeepSeek API
- Ask questions with natural language
- Perform targeted searches
- Easy installation and configuration

## Prerequisites

- **Bash**: Available by default on most Unix-like systems (e.g., Linux, macOS)
- **`curl`**: Used for making API requests, typically pre-installed
- **`jq`**: A lightweight JSON processor. Install it with:
  - macOS: `brew install jq`
  - Ubuntu: `sudo apt-get install jq`
  - Fedora: `sudo dnf install jq`

## Installation

Follow these steps to set up the DeepSeek CLI on your system:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Jack5316/deepseek-cli.git
   ```

2. **Navigate to the directory**:
   ```bash
   cd deepseek-cli
   ```

3. **Make the script executable**:
   ```bash
   chmod +x deepseek.sh
   ```

4. **Move the script to a PATH directory** (optional, for system-wide access):
   ```bash
   sudo mv deepseek.sh /usr/local/bin/deepseek
   ```

## Usage

The tool provides two primary commands:

### Ask a question

```bash
deepseek ask "Your question here"
```

### Perform a search

```bash
deepseek search "Your search query here"
```

## Examples

**Ask a simple question**:
```bash
deepseek ask "What is the capital of France?"
```

**Search for detailed information**:
```bash
deepseek search "Latest AI developments in 2025"
```

## Security Note

⚠️ **Important**: The API key is hardcoded in the script. Keep it secure and avoid sharing the script publicly with your key included. Consider implementing a more secure method for storing the API key.

## Customization

You can tailor the tool to your needs:

- **API Key**: Update the `API_KEY` variable in the script with your own DeepSeek API key.
- **System Prompts**: Adjust the prompts in the `deepseek_ask` and `deepseek_search` functions to modify the AI's behavior.
- **Output Format**: Modify the JSON parsing to change how responses are displayed.

## Uninstallation

To remove the tool from your system:

```bash
sudo rm /usr/local/bin/deepseek
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to:

- Open an issue to report bugs or suggest features
- Submit a pull request with improvements
- Share how you're using the tool

## Author

Created by Jiawei (Jack) Tan

---

*Last updated: 2025-03-04*

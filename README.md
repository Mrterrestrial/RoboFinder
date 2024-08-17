# RoboFinder

RoboFinder is a Bash tool designed to extract unique paths from archived `robots.txt` files of a target domain using the Wayback Machine. It automates the process of fetching
`robots.txt` files from different timestamps, extracting the disallowed paths, and presenting a unique, sorted list of those paths.

## Features

- **Fetch Archived `robots.txt` Files:** Retrieves `robots.txt` files with a status code of 200 from the Wayback Machine.
- **Extract Disallowed Paths:** Extracts all `Disallow` paths specified in the `robots.txt` files.
- **Unique and Sorted Output:** Outputs a unique and sorted list of paths to a text file.

## Requirements

The following tools must be installed on your system:

- `curl`: For making HTTP requests.
- `jq`: For processing JSON data.
- `grep`: For pattern matching.
- `awk`: For text processing.
- `sort`: For sorting the output.

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/Mrterrestrial/RoboFinder.git
   ```

2. Make the Script Executable:

    ```bash
    chmod +x RoboFinder.sh
    ```

## Usage

- Run the script with the target domain as an argument:

    ```bash
    ./RoboFinder.sh target.tld
    ```
This command will generate a file named target.tld_robots_paths.txt containing the unique paths extracted from the robots.txt files.

## License

This project is licensed under the MIT License - see [MIT License](https://opensource.org/licenses/MIT) for details.


## Contributing

Feel free to fork the repository and submit pull requests. For any issues or feature requests, please open an issue on GitHub.




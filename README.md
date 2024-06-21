# Stupid Idea

Welcome to the Stupid Idea repository! 

This project is designed to demonstrate an automated workflow for making random commits to a GitHub repository using GitHub Actions.


## Features

- Automated daily commits with random messages
- Dynamic rescheduling of commit time every morning and afternoon
- GPG-signed commits for authenticity 
- Completely free and open source


### Installation

1. Clone the repository:
   
    ```bash
    git clone https://github.com/merson21/stupid-idea.git
    cd stupid-idea
    ```

2. Set up the necessary GitHub Secrets:

    - `GHA_TOKEN`: Your GitHub token
    - `GPG_KEY_ID`: Your GPG key ID
    - `GPG_PRIVATE_KEY`: Your GPG private key


### Usage

This project uses a GitHub Actions workflow to automatically commit changes twice a day. 
The workflow is defined in `.github/workflows/commit-scheduler.yml`.

#### Schedule

- **Morning Commit**: The workflow will run at a random time between 4:00 AM and 11:59 AM.
- **Afternoon Commit**: The workflow will run at a random time between 12:00 PM and 10:59 PM.

The commit times are dynamically rescheduled after each run, ensuring variability and unpredictability in commit times.

To trigger the workflow manually, you can use the "Run workflow" button in the Actions tab of your repository.


### Customization

You can customize the commit messages and the times for the automated commits by editing the `commit-scheduler.yml` file.


### Contributing

We welcome contributions! Please fork the repository and create a pull request with your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


## Contact

For any questions or suggestions, feel free to open an issue or contact the repository owner.


# coverme

Simple serverless service to track code coverage

![coverme](coverme.gif)

## New coverage report

    POST /coverages
    {
      "repo_url": "https://github.com/networth-app/networth",
      "ref": "master",
      "coverage": "90",
      "settings": "bro, Slack me when coverage felt more than 2%. Thank you!"
    }

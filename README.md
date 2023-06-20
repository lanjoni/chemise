# Chemise Bot (Crystal Version) <img align="right" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/crystal/crystal-original.svg" alt="Crystal logo" width="100">

Chemise is a very interesting bot that contains the basis for every bot written in Crystal to be used on Twitch, supporting chat commands, direct responses, requests with APIs with or without parameters!

The possibilities with Chemise are endless! Customize however you like!

## Description

Written using Crystal, you'll need to have it installed and a basic understanding of how it works! If you're interested, access the official repository of the <a href="https://github.com/lanjoni/crystal4noobs">crystal4noobs project</a>, which contains a guide for beginners with the Crystal language completely written in Portuguese!

## Getting Started

### Dependencies
Crystal, Shards and a package manager!

### Token

To guarantee access to your token, just click <a href="https://twitchapps.com/tmi/">here</a> and log in with the Twitch in which you will use Chemise! The JSON structure for connection is very simple: the name of the channel that the bot will be "listening" to and your bot's token!

```json
{
    "twitch": {
        "account": "youraccount",
        "token": "yourpersonaltoken"
    }
}
```

### How to use?

After setting up your account with your token you are free to customize all the source code the way you want! The code itself that will be the base executed is located in "src/run.cr"... In it you can customize your commands and your favorite APIs, and you can even change how it works!

To test it, just run the command below:

```sh
$ crystal src/run.cr connect/token.json 
```

## Authors

Contributors names and contact info:

[@lanjoni](https://twitter.com/gutolanjoni)

## Version History

* 0.2
    * Commands using JSON
* 0.1
    * Initial Release

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

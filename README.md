# network-analyzer
overkill tool to help non-technical gamers troubleshoot network-related netplay issues

# Getting Started

## Prerequisites

- Virtualization (VT-x/AMD-V) enabled in your BIOS
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/downloads) installed
- Reboot after installing VirtualBox

# Usage

## Initial setup

- Download and extract [Network Analyzer](https://github.com/smash64-dev/network-analyzer/archive/main.zip)
- Open a command prompt / terminal in the analyzer directory
- Create and configure the virtual machine with

```
$ vagrant up
```

- This may take a few minutes to complete
- Check the output for the following, and visit the link in your browser

```
==> default: You can view the analyzer at one or more of the following addresses...
Connection to 127.0.0.1 closed.
    default: http://10.0.2.64/smokeping
    default: http://192.168.1.64/smokeping
```

## Updating configs

- To change targets edit `config/UserTargets.yml`\
(There are example configs in the `examples` directory)
- To change other smokeping config, edit `data/smokeping/*` after the initial setup
- Open a command prompt / terminal in the analyzer directory
- Reload the configuration with
```
$ vagrant reload
```
- This may take a few minutes to complete
- Refresh your browser after it finishes
- If refreshing fails, check the output a different link

## Shutting down the analyzer

- Open a command prompt / terminal in the analyzer directory
- Shutdown the virtual machine with

```
$ vagrant suspend
```

## Checking if the analyzer is running

- Open a command prompt / terminal in the analyzer directory
- Check th status of the analyzer with

```
$ vagrant status
```

## Deleting the analyzer

- Open a command prompt / terminal in the directory
- Delete the virtual machine with

```
$ vagrant destroy
```

- This will delete the entire virtual machine and smokeping stats
- The smokeping **config** is saved in the `data` directory

# FAQ

- **Q:** Isn't this just [smokeping](https://oss.oetiker.ch/smokeping/)?\
**A:** Yes, for now; but maybe it will do other things later!

- **Q:** This seems like overkill, is there not an easier way?\
**A:** Yea, probably

- **Q:** Why does vagrant take so long on Windows?\
**A:** It's a known issue, see [Vagrant CLI on Windows is very slow](https://github.com/hashicorp/vagrant/issues/11853)

# License

License is [Unlicense](LICENSE.md).

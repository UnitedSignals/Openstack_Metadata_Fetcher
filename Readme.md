# Meta

## Synopsis

This tool can be used to retrieve meta data inside a VM of an OpenStack cluster. Metadata can be configred during the creation of a VM and can be manually retrieved from an OpenStack provided server via HTTPS. 

This tool automates the retrieval and extraction process and just returnes the value to the corresponsing metadata key.

## Build Dev Version

```
$ make build
```

## Run Dev Version

```
$ make run
```

## Build release

```
$ make release_build
```

## Installation in an Openstack VM

```
$ sudo sh -c "$(curl -fsSL 'https://raw.githubusercontent.com/UnitedSignals/Openstack_Metadata_Fetcher/main/install.sh?token=GHSAT0AAAAAACS5XYNZOEDRCLPF3244FI7GZUPU6NQ')"
```

## Usage

Once copied to the target VM, the tool should be put into a folder, where typically binaries reside. For example `/usr/local/bin`. The installer above will do that for you. Should you decide to manually install the tool, you have to take care about it yourself.

Afterwards one can retrieve keys just by calling:

```
$ meta <key_name>
```

**Example:**

The metadata key "FOO" can be retrieved via:

```
$ meta FOO
```

## Help

```
$ make
```

## Author

Jan Roesner <jan.roesner@united-signals.com>

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

## Usage

Once copied to the target VM, the tool should be put into a folder, where typically binaries reside. For example `/usr/local/bin`.

Afterwards one can retrieve keys just by callig:

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

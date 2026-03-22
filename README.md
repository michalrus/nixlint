# nixlint

Run all Nix linters on files or directories with a single command.

nixlint is a linter aggregator that orchestrates four independent Nix
static-analysis tools and combines their results into one exit code:

| Linter                                             | What it checks                                                  |
| -------------------------------------------------- | --------------------------------------------------------------- |
| [statix](https://github.com/nerdypepper/statix)    | Anti-patterns and style issues                                  |
| [deadnix](https://github.com/astro/deadnix)        | Dead / unused code                                              |
| [nil](https://github.com/oxalica/nil)              | LSP-grade diagnostics (parse errors, undefined variables, etc.) |
| [nixf-tidy](https://github.com/nix-community/nixd) | Variable-lookup analysis and structural issues                  |

## Installation

Add nixlint as a flake input:

```nix
{
  inputs.nixlint.url = "github:michalrus/nixlint";
}
```

Or build directly:

```sh
nix build github:michalrus/nixlint
```

## Usage

```
nixlint [--fix] [<file-or-dir>...]
```

```sh
nixlint                         # lint all .nix files in the current repo
nixlint ./hosts/                # lint a directory
nixlint flake.nix default.nix   # lint specific files
nixlint --fix                   # auto-fix (statix + deadnix only)
```

When no paths are given, nixlint defaults to the root of the current Git
repository (or `.` outside of one). Inside Git repos it uses `git ls-files`
to discover tracked and untracked `.nix` files; outside Git it falls back to
`find`.

## License

[Apache-2.0](LICENSE)

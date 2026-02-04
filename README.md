# Internal Sysand Package Index -- GitHub edition

Project to host internal SysML v2 packages through private GitHub repos.

> [!NOTE]
> Since GitHub Pages do not allow authorization using Personal Access
> Tokens, this example is a rather dirty workaround that uses
> `raw.githubusercontent.com` to expose the files to Sysand CLI.

The URL of the index: `https://raw.githubusercontent.com/simonas-drauksas-sensmetry/sysand-private-index/refs/heads/index/`

## Deployment workflow

1. Create a branch and PR that adds your `.kpar` file to the
   `packages/<project>/` folder.
   - The internal package registry uses the `urn:kpar:` + the `name` field from
     `.project.json` for the IRI.
   - Thus, the `name` **shall** be ASCII-only, with no spaces (`-` strongly
     encouraged to be used in place of the space), lowercase-only, and no longer
     than 32 characters.
   - The `<project>` folder **should** be called the same as the `name` for
     easier file discovery in the repo itself, but otherwise there is no strict
     rule.
   - The name of the `.kpar` file does not matter, but it is strongly suggested
     for it to have a version number inside it, so that if there are multiple
     versions of the same project, the `.kpar`s do not overwrite each other
     accidentally.
2. **TODO** The CI/CD pipeline then checks your `.kpar` file by:
    - Checking if `.project.json` and `.meta.json` are filled out
    - Trying to install the `.kpar` with `sysand add <path to kpar>` to see if
      all the packages your package depends on are available. \*
    - Seeing if any errors are raised by the latest Syside CLI.
3. When the pipeline passes, the MR can be merged in.
4. When on `main`, a new pipeline starts that:
    1. Uses Sysand to create an environment (`sysand env`)
    2. Uses Sysand to install all `.kpar`s from `packages/**` folder (`sysand
       env install --path /path/to/kpar --no-deps <IRI as described in step
       1.>`)
    3. Copies all contents of `sysand_env` folder to `index` folder and saves
       the index folder as an artifact
    4. Checks out the `index` branch, `git reset --hard`s to a commit that made
       the `index` branch have no files.
    5. Extracts the `index` contents from the build artifact.
    6. `git add`s all the contents, commits the changes with `Publish Index`
       commit, and **force** pushes \*\* to `index` branch.

_\* NOTE:_ This means that if you want to publish two packages, one of which
depends on the other, you should create two MRs.

_\*\* NOTE:_ Force pushing is used to avoid making the git repo size from
exploding with each commit. Additionally, the `index` branch should not be used
by humans, and it only contains the automatically generated artifacts. Ideally,
the branch should be protected and only the bot account should be able to push
to it.

### CI Auth with Private Index

For the CI to be able to pull packages from the private index, it needs to get
access through it. Since Sysand 0.0.9, the basic HTTP auth happens through
environment variables `SYSAND_CRED_<X>`, `SYSAND_CRED_<X>_BASIC_USER` and
`SYSAND_CRED_<X>_BASIC_PASS`, or `SYSAND_CRED_<X>_BEARER_TOKEN` where `<X>` in
this case is `GITHUB`, but can be anything.

```sh
export SYSAND_CRED_SENSINTERNAL = "https://raw.githubusercontent.com/simonas-drauksas-sensmetry/sysand-private-index/refs/heads/index/**"
export SYSAND_CRED_SENSINTERNAL_BEARER_TOKEN = $SYSAND_INDEX_PAT
```

where `$SYSAND_INDEX_PAT` should be a GITHUB_TOKEN set by including

```
env:
    SYSAND_INDEX_PAT: ${{ secrets.GITHUB_TOKEN }}
```

in the GitHub Action setup.

## Using workflow

1. Create a [GitHub Personal Access
   Token](https://github.com/settings/personal-access-tokens) (we recommend
   using fine-grained tokens) scoped to the index repository and the `Contents`
   read-only permissions.
2. Create a `.env` file or use other means to set the following environment
   variables. For `<X>` you can use whatever you want.
    - `SYSAND_CRED_<X>` with the value `https://raw.githubusercontent.com/simonas-drauksas-sensmetry/sysand-private-index/refs/heads/index/**` (the `refs/heads/index/**` part is important!)
    - `SYSAND_CRED_<X>_BEARER_TOKEN` with the value set to the Personal Access
      Token generated in step 1.
3. Use the `--index` Sysand CLI argument with the value of
   `https://raw.githubusercontent.com/simonas-drauksas-sensmetry/sysand-private-index/refs/heads/index/` when installing the packages from
   this index OR use `sysand.toml` config file with the index set there.

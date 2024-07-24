# dotfiles

My dotfiles, managed by [chezmoi](https://github.com/twpayne/chezmoi).

## Initial setup

`chezmoi init --apply alexandre-croteau`

## Updating

`chezmoi update`

## GPG

### Backup

```sh
gpg --export --export-options backup --output public.gpg
gpg --export-secret-keys --export-options backup --output private.gpg
gpg --export-ownertrust > trust.gpg
```

### Restore

```sh
gpg --import public.gpg
gpg --import private.gpg
gpg --import-ownertrust trust.gpg
```

### Revoke

* Revoke your key; export the revocation certificate

  `gpg --output revoke.asc --gen-revoke KEYID`

* Import the revocation certificate back to your (local) keyring

  `gpg --import revoke.asc`

* Check that your key is revoked

  `gpg --list-keys`

* Export your now-revoked public key

  `gpg --output public.pgp --armor --export KEYID`

* Add your now-revoked public key (i.e., public.pgp) to GitHub.

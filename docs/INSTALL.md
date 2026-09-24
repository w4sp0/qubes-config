# Install

Qusal install and update guide.

## Table of Contents

*   [Installation](#installation)
    *   [Prerequisites](#prerequisites)
    *   [DomU Installation](#domu-installation)
    *   [Dom0 Installation](#dom0-installation)
*   [Update](#update)
    *   [DomU Update](#domu-update)
    *   [Dom0 Update with Git](#dom0-update-with-git)
    *   [Dom0 Update by literally copying the git repository](#dom0-update-by-literally-copying-the-git-repository)
*   [Template upgrade](#template-upgrade)
    *   [Clean install](#clean-install)
    *   [Upgrade a template in-place](#upgrade-a-template-in-place)

## Installation

### Prerequisites

You current setup needs to fulfill the following requisites:

*   Qubes OS R4.2
*   Internet connection

### DomU Installation

It is recommended to use separate qube from your normal operations as this
installation will eventually be copied to dom0. Apart from that, it is also
recommended to use a separate qube for fetching the signing keys, different
from the one acquiring Qusal. The separate qubes should be DispVM, but AppVM
or StandaloneVM will also work.

1.  Install `git` in the qube, if it is an AppVM, install it it's the
    TemplateVM and restart the AppVM.

2.  Clone the repository (if you made a fork, fork the submodule(s) before
    clone and use your remote repository instead, the submodules will also be
    from your fork).

    ```sh
    git clone --recurse-submodules https://github.com/w4sp0/qubes-config.git ~/qusal
    ```

3.  In the qube for the signing keys, save the
    [maintainer's signing key](https://github.com/w4sp0/qubes-config/raw/main/salt/qubes-builder/files/client/qusal/keys/A3A03DD3ED22D21E653E842B47B7A28B999E0D56.asc)
    to the file `/home/user/wassp.asc`. The key is also published on the
    maintainer's GitHub account at <https://github.com/w4sp0.gpg>, compare the
    fingerprint from both sources. If you are the maintainer, export the key
    from the qube that holds the private key instead:

    ```sh
    gpg --export --armor A3A03DD3ED22D21E653E842B47B7A28B999E0D56 \
      > /home/user/wassp.asc
    ```

### Dom0 Installation

Before copying anything to Dom0, read [Qubes OS warning about consequences of
this procedure](https://www.qubes-os.org/doc/how-to-copy-from-dom0/#copying-to-dom0).

<!--
qvm-run --no-gui --pass-io --localcmd="UPDATES_MAX_FILES=50000
  /usr/libexec/qubes/qfile-dom0-unpacker \"${USER}\"
  ~/QubesIncoming/\"${qube}\"" \
  "${qube}" /usr/lib/qubes/qfile-agent "${file}"
-->

1.  Copy the repository `$file` from the DomU `$qube` to Dom0 (substitute
    `CHANGEME` for the desired valued):

    ```sh
    qube="CHANGEME" # qube name where you downloaded the repository
    file="CHANGEME" # path to the repository in the qube

    mkdir -p -- ~/QubesIncoming/"${qube}"
    qvm-run --no-gui --pass-io -- "${qube}" "tar -cf - -C ~ qusal" |
      tar -xf - -C ~/QubesIncoming/"${qube}"
    ```

2.  Pass the maintainer's key from the qube that has it (`key_qube`) to
    Dom0. Use the full path, `~` is not the home directory of the qube:

    ```sh
    key_qube="CHANGEME" # qube where you saved the signing key
    qvm-run --no-gui --pass-io -- "${key_qube}" "cat -- /home/user/wassp.asc" |
      tee -- /tmp/wassp.asc >/dev/null
    ```

3.  Verify that the key fingerprint matches
    `A3A0 3DD3 ED22 D21E 653E  842B 47B7 A28B 999E 0D56` and the user IDs are
    `wassp` and `<cyberwassp@gmail.com>`. You can use Sequoia-PGP or GnuPG
    for the fingerprint verification:

    ```sh
    gpg --show-keys /tmp/wassp.asc
    # or
    #sq inspect /tmp/wassp.asc
    ```

4.  Import the verified key to your keyring:

    ```sh
    gpg --import /tmp/wassp.asc
    ```

    The commits are signed with a subkey, so `git verify-commit` names the
    subkey `E465 C11C 5CFF BF62 BD66  DC8D 7881 0E06 8636 9D7A`. GnuPG warns
    that the key is not certified with a trusted signature until you set the
    owner trust of the key. The signature is verified regardless.

5.  Enter the repository:

    ```sh
    cd ~/QubesIncoming/"${qube}"/qusal
    ```

6.  Verify the [commit or tag signature](https://www.qubes-os.org/security/verifying-signatures/#how-to-verify-signatures-on-git-repository-tags-and-commits)
    and expect a good signature, be surprised otherwise:

    ```sh
    git verify-commit HEAD
    ```

    In case the commit verification failed, you can try to verify if any tag
    pointing at that commit succeeds:

    ```sh
    tag_list="$(git tag --points-at=HEAD)"
    verified=0
    for tag in ${tag_list}; do
      if git verify-tag "${tag}"
        verified=1
        break
      fi
    done
    if test "${verified}" = "0"; then
      printf '%s\n' "Failed to verify qusal" >&2
      false
    fi
    ```

7.  Copy the project to the Salt directories:

    ```sh
    ~/QubesIncoming/"${qube}"/qusal/scripts/setup.sh
    ```

## Update

To update, you can copy the repository again to dom0 as instructed in the
[installation](#installation) section above or you can use easier methods
demonstrated below.

### DomU Update

Update the repository state in your DomU:

```sh
git -C ~/src/qusal fetch --recurse-submodules
```

### Dom0 Update with Git

This method is more secure than literally copying the whole directory of the
repository to dom0 but the setup is more involved. Requires some familiarity
with the sys-git formula.

1.  Install the [sys-git formula](salt/sys-git/README.md) and push the
    repository to the git server.

2.  Install `git` on Dom0, allow the Qrexec protocol to work in submodules and
    clone the repository to `~/src/qusal` (only has to be run once):

    ```sh
    mkdir -p ~/src
    sudo qubesctl state.apply sys-git.install-client
    git clone qrexec://@default/qubes-config.git ~/src/qusal
    git -C ~/src/qusal config submodule.salt/dotfiles.url \
      qrexec://@default/dotfiles
    git -C ~/src/qusal submodule update --init
    ```

    The submodule URL in `.gitmodules` points to GitHub, which Dom0 cannot
    reach. The local configuration overrides it.

3.  Next updates will be pulling instead of cloning:

    ```sh
    git -C ~/src/qusal pull --recurse-submodules
    git -C ~/src/qusal submodule update --merge
    ```

4.  Verify the commit or tag signature as shown in
    [Dom0 Installation](#dom0-installation).

5.  Copy the project to the Salt directories:

    ```sh
    ~/src/qusal/scripts/setup.sh
    ```

### Dom0 Update by literally copying the git repository

This method is similar to the installation method, but easier to type. This
method is less secure than Git over Qrexec because it copies the whole
repository, including the `.git` directory which holds files that are not
tracked by git. It would be easier to distrust the downloader qube if the
project had a signed archive. The `.git/info/exclude` can exclude modified
files from being tracked and signature verification won't catch it.

1.  Install the helpers scripts and git on Dom0 (only has to be run once):

    ```sh
    sudo qubesctl state.apply dom0.install-helpers
    sudo qubes-dom0-update git
    ```

2.  Copy the repository `$file` from the DomU `$qube` to Dom0 (substitute
    `CHANGEME` for the desired valued):

    ```sh
    qube="CHANGEME" # qube name where you downloaded the repository
    file="CHANGEME" # path to the repository in the qube

    rm -rf ~/QubesIncoming/"${qube}"/qusal
    UPDATES_MAX_FILES=50000 qvm-copy-to-dom0 "${qube}" "${file}"
    ```

3.  Verify the commit or tag signature as shown in
    [Dom0 Installation](#dom0-installation).

4.  Copy the project to the Salt directories:

    ```sh
    ~/QubesIncoming/"${qube}"/qusal/scripts/setup.sh
    ```

## Template upgrade

Template upgrade refers to template major releases upgrade.

### Clean install

As we use Salt, doing clean installs are easy. Unfortunately QubesOS does not
provided a CLI program to rename qubes.

1.  Open `Qube Manager`, select the template you want to upgrade and rename it
    adding the suffix `-old`. The `Qube Manager` will change the `template`
    preference of qubes based on the chosen template.
2.  Rerun the formulas that targeted the chosen template.
3.  If the formula fails, use `Qubes Template Switcher` to set the `-old`
    template to be used by the qubes managed by that specific formula.
4.  Repeat for every template that needs to be upgraded.

### Upgrade a template in-place

This method is discouraged as it leads to different results compared to
installing a new template. Fixes done upstream by Qubes OS to the build system
of templates, such as package list, cannot be backported to old templates. In
other words, in-place upgrades leads to a different environment compared to
installing a new template.

One advantage of this method is when dealing with a StandaloneVM, as important
data can be present in the root volume, in-place upgrades are easier for this
qube class instead of doing a migration of specific folders and files to the
new qube.

1.  If you still want to do upgrade in-place, refer to upstream guides, for
    [Debian](https://www.qubes-os.org/doc/templates/debian/in-place-upgrade)
    and
    [Fedora](https://www.qubes-os.org/doc/templates/fedora/in-place-upgrade).
2.  Rerun the formulas that targeted the chosen template.
3.  Repeat for every template that needs to be upgraded.

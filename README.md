# Digital Obsidian Garden + Docker

This is a fork of the [template](https://github.com/oleeskild/digitalgarden) to be used together with the [Digital Garden Obsidian Plugin](https://github.com/oleeskild/Obsidian-Digital-Garden).

This version is for self-hosted (with [Docker](https://docker.com)) use.

There is also a [fork](https://github.com/foxblock/digitalgarden_gh-pages) that uses github pages.

## Setup

1. Download and install the community plugin Digital Garden in Obsidian.

2. Next, you will need a GitHub account. If you don't have this, create one [here](https://github.com/signup).

3. Create a new repository (both public and private will work) using this one as a template (green button in the top right). Keep "Include all branches" unchecked.

4. Clone **created** repository via ssh

    ```bash
    git clone <ssh-url>
    ```

5. Generate ssh keys

    ```bash
    ssh-keygen -t ed25519 -C "digitalgarden" -f .ssh/id_ed25519
    ```

6. Copy the public key (`.ssh/id_ed25519.pub`) to your [GitHub account](https://github.com/settings/keys)

7. Build docker image

    ```bash
    docker compose build
    ```

8. Run docker containers

    ```bash
    docker compose up
    ```

9. In Obsidian publish any note with the `dg-home` and `dg-publish` properties set to true to generate an index file for your site. Publishing via the plugin will automatically create a commit to the main branch of your new repo, which will be pulled by the docker container.

10. After a minute or so your site should be available at a port `8880`, for example <http://localhost:8880> if you are running it locally. You can change this port in `docker-compose.yaml`. You may also setup a reverse proxy like Nginx, proxying requests to that port.

## Updates

Because you are working from a fork of the original template, you cannot use the "Update template" feature of the Obisdian plugin - it would overwrite some of the changes made.
![update-template](https://github.com/user-attachments/assets/4f912307-ee1e-4b7c-962d-f88bb0eaeb31)

For library updates the [dependabot feature](https://docs.github.com/en/code-security/getting-started/dependabot-quickstart-guide#enabling-dependabot-for-your-repository) is enabled by default. It will run once a week and create pull requests for library updates. Note that not all updates might be compatible and can break things. Check the actions tab for any errors during deployment after you apply updates. Also note that security alerts are disabled by default, you can enable them in the settings (see above link).

For any other update to the template you sadly will have to manually check for it and copy them over to your repository.

## Docs

Docs for authoring and customizing the plugin and site are available at [dg-docs.ole.dev](https://dg-docs.ole.dev/)

## Credits

@davidkopp - [Setup example](https://github.com/oleeskild/obsidian-digital-garden/discussions/160#discussioncomment-7126917)

@foxblock - Dependabot setup. Also portions of this README are adapted from their [repository](https://github.com/foxblock/digitalgarden_gh-pages).

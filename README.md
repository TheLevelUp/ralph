# Ralph

Ralph is the LevelUp Platform team's beloved [Zulip](https://zulip.com) chat bot. He's a version of GitHub's [Hubot](https://hubot.github.com/).

## Development

In order to run Ralph locally, you'll need:

* [Node.js](https://nodejs.org/) 6.11 or newer
* [PostgreSQL](https://www.postgresql.org/) 12 or newer

First, create a Postgres database and tell Ralph how to connect to it.

```sh
createdb ralph_development
echo 'export DATABASE_URL=postgres://localhost/ralph_development' > .env
```

Run Ralph locally using `bin/hubot`. You'll see some startup output and a prompt.

```
$ bin/hubot
[Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading adapter shell
Hubot>
```

Then you can interact with Ralph by typing `hubot help`.

```
Hubot> hubot help

Hubot> animate me <query> - The same thing as `image me`, except adds a few
convert me <expression> to <units> - Convert expression to given units.
help - Displays all of the help commands that Hubot knows about.
...
```

## Deployment

Ralph is deployed on [Heroku](https://heroku.com/) through the [lu-ralph](https://dashboard.heroku.com/pipelines/0e0e3940-b241-4387-94a4-e4cb43e602fb) Heroku pipeline, which contains staging and production apps:

* [lu-stg-ralph-rw-va](https://dashboard.heroku.com/apps/lu-stg-ralph-rw-va)
* [lu-prd-ralph-rw-va](https://dashboard.heroku.com/apps/lu-prd-ralph-rw-va)

Pushing to the `main` branch of [thelevelup/hubot-ralph](https://github.com/thelevelup/ralph) will automatically trigger a deployment to staging. You can test your changes by addressing Ralph Staging in the [Zulip #test stream](https://levelup.zulipchat.com/#narrow/stream/25709-test):

> **Ross:** ralph staging ping<br>
> **Ralph Staging:** PONG

When you've verified your changes using Ralph Staging, promote them to production.

```sh
heroku pipelines:promote --app lu-stg-ralph-rw-va
```

While it is tempting, try to avoid [deploying Ralph to other LevelUp services' staging environments](https://levelup.zulipchat.com/#narrow/stream/23281-heroku/topic/levelup-staging.20deployed/near/37563099).

## License

MIT


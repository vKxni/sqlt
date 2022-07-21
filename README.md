[![Discord](https://img.shields.io/discord/823720615965622323.svg?style=for-the-badge)](https://discord.gg/UDNcTrBagN)
[![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/vkxni)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)](https://github.com/alelievr/Mixture/blob/master/LICENSE)

<p align="center">
<img src="https://cdn.discordapp.com/attachments/893792219390156850/999670328299098183/sqlt.png"  alt="sqlt" width="280" height="200"/></a>
<p>

## SQLT :: PostgeSQL
A simple Ecto-ORM logger written in pure Elixir.

<hr>

> ##### Written in [Elixir](https://elixir-lang.org) 
<a target="_blank" rel="noreferrer"> 
 <img src="https://www.vectorlogo.zone/logos/elixir-lang/elixir-lang-icon.svg" alt="elixir" width="30" height="30"/></a>

> ##### Tested with [PostgreSQL](https://www.postgresql.org/)

 <a target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/postgresql/postgresql-original-wordmark.svg" alt="postgresql" width="30" height="30"/>
 <hr>

### Get started 
First you have to install Elixir (v13.2+) with OTP Version 23+

> - Clone the repository
```
$ git clone https://github.com/vkxni/sqlt

$ cd sqlt
```

> - Install the dependencies
```
$ mix deps.get
```

> - Check if mix is working
```
$ mix status
```

> - Setup the database 

* Info: Your first have to fill out the `.env` file.

If there is data in the database, you can drop it.
```
$ mix ecto.drop
```

Then create the database (tables, schemas ...)
```
$ mix ecto.create


# optional (advanced)
$ mix ecto.migrate
```

> - Launch iex
```
$ iex -S mix
```

> - Run Queries

Inserting, editing, deleting and purging data. 

```
iex> Query.insert

iex> Query.multi_insert

iex> Query.edit

iex> Query.delete

iex> Query.purge
```
<hr>

> - Showcase

Once ran, a `raw.sql` file will be created in the root directory of your folder.

[![Showcase](showcase.gif)](https://youtu.be/vt5fpE0bzSY)
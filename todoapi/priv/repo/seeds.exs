# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Todoapi.Repo.insert!(%Todoapi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Todoapi.Repo
alias Todoapi.Users.User

Repo.insert! %User{
  email: "user1@user.com",
  hash_password: Bcrypt.hash_pwd_salt("123456")
}

Repo.insert! %User{
  email: "user2@user.com",
  hash_password: Bcrypt.hash_pwd_salt("123456")
}

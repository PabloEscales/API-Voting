# Documentation on how to use the API.
* Dev: Pablo Escales


## Project name: Assembly Voting Technical Assignment
* The goal is to write a voting application API.

## Main endpoints:

### To see elections list:
* GET api/v1/elections

[
  {
    "name": "Food Preferences",
  },
  {
    "name": "Drink Preferences"
  }
]

### To see invidivual election:
* GET api/v1/elections/:election_id

{
  "name": "Food Preferences"
}

### To see list of ballots for an election:
* GET api/v1/elections/:election_id/balllots

"[
  {
    "name": "Best Ice Cream flavour",
    "type": "multiple-choice",
    "options":
      "Vanilla,
      Chocolate,
      Strawberry,
      Cookie Dough"
  },
  {
    "name": "Tastiest Breakfast",
    "type": "single-choice",
    "options":
      "Toast,
      Pancakes,
      Sandwich,
      Cereal"
  },
  {
    "name": "Favourite Style of Food",
    "type": "write-in",
    "options": ""
  }
]"

### To see invidivual ballots for an election:
* GET api/v1/elections/:election_id/balllots/:ballot_id

{
  "name": "Best Ice Cream flavour",
  "type": "multiple-choice",
  "options":
    "Vanilla,
    Chocolate,
    Strawberry,
    Cookie Dough"
}

## To register a user in one of the elections:
* POST api/v1/registrations

{
  "id": 1,
  "election_id": 1,
  "user_id": 1
}

### To vote for an election ballot:
* POST api/v1/elections/:election_id/balllots/:ballot_id/votes

[
  {
    "id": 1,
    "registration_id": 1,
    "value": "Vanilla, Chocolate, Toast, Pasta"
  }
]

### To see list of vote for an election ballot:
* GET api/v1/elections/:election_id/balllots/:ballot_id/votes

[
  {
    "value": "Vanilla, Chocolate"
  }
  {
    "value": "Toast"
  }
  {
    "value": "Pasta"
  }
]

### To adjust the vote for an election ballot:
* PATCH api/v1/elections/:election_id/balllots/:ballot_id/votes/:votes_id

[
  {
    "value": "Vanilla, Chocolate"
  }
  {
    "value": "Toast"
  }
  {
    "value": "Seafood"
  }
]

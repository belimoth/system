import os
import sys
import json

# https://docs.python-requests.org/
import requests

username = os.environ.get( "GITHUB_USERNAME" )
token    = os.environ.get( "GITHUB_TOKEN" )

session = requests.Session()
session.auth = ( username, token )

# https://docs.github.com/en/rest/reference/repos#create-an-organization-repository

slug = sys.argv[1]

organization = slug.split( "/" )[0]
repo         = slug.split( "/" )[1]

url = "https://api.github.com/orgs/" + organization + "/repos"

if ( organization == username ):
    url = "https://api.github.com/user/repos"

data = {
    "name" : repo,

    "private" : True,
    # "visibility" : "private",

    "has_issues"   : False,
    "has_projects" : False,
    "has_wiki"     : False,

    "allow_squash_merge" : False,
    "allow_rebase_merge" : False,
    "allow_auto_merge"   : False,
}

result = session.post( url, json = data )

# TODO handle errors

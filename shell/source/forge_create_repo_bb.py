import os
import sys
import json

# https://docs.python-requests.org/
import requests

username = os.environ.get( "BITBUCKET_USERNAME" )
token    = os.environ.get( "BITBUCKET_TOKEN" )

session = requests.Session()
session.auth = ( username, token )

# https://developer.atlassian.com/bitbucket/api/2/reference/resource/repositories/%7Bworkspace%7D/%7Brepo_slug%7D#post

slug = sys.argv[1]

url = "https://api.bitbucket.org/2.0/repositories/" + slug

data = {
	"is_private" : True,

	"has_issues" : False,
	"has_wiki"   : False,
}

result = session.post( url, json = data )

# TODO handle errors

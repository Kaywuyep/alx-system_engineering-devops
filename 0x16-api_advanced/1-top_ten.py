#!/usr/bin/python3

"""
prints the titles of the first 10 hot posts listed for a given subreddit
"""

import requests


def top_ten(subreddit):
    """
    function that queries the Reddit API
    prints the titles of the first
    10 hot posts listed for a given subreddit
    """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=10"
    headers = {'User-Agent': 'Custom User Agent'}
    # Set a custom User-Agent to avoid rate limiting

    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()
        # Raise an exception for bad status codes
        data = response.json()
        if 'data' in data and 'children' in data['data']:
            posts = data['data']['children']
            for post in posts:
                print(post['data']['title'])
        else:
            print("No posts found.")
    except requests.exceptions.RequestException as e:
        print("None")


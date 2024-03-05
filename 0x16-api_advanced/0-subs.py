#!/usr/bin/python3
"""
a function that returns the number of subscribers for a given subreddit
"""
import requests


def number_of_subscribers(subreddit):
    """
    number of not active users, total subscribers
    """
    url = 'https://www.reddit.com'
    headers = {'user-agent': 'fake_user'}

    try:
        response = requests.get(
            url + "/r/" + subreddit + "/about.json", headers=headers
        )
        response.raise_for_status()
        # Raise an exception for 4xx or 5xx status codes
        dict_response = response.json()
        return dict_response.get('data', {}).get('subscribers', 0)
    except requests.exceptions.RequestException as e:
        print("Error:", e)
        return 0
    except json.decoder.JSONDecodeError as e:
        print("Error decoding JSON:", e)
        return 0

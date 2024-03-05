#!/usr/bin/python3
""" a module that counts sorted keywords"""
import requests


def count_words(subreddit, word_list):
    """
    returns the number of sorted count words recuesive
    """
    return _count_words_recursive(subreddit, word_list)


def _count_words_recursive(subreddit, word_list, after=None, counts=None):
    """
    sorted count of given keywords
    """
    base_url = "https://www.reddit.com"
    if counts is None:
        counts = {}

    if after is None:
        url = f"{base_url}/r/{subreddit}/hot.json?limit=100"
    else:
        url = f"{base_url}/r/{subreddit}/hot.json?limit=100&after={after}"

    headers = {'User-Agent': 'Custom User Agent'}

    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()
        data = response.json()

        posts = data['data']['children']
        for post in posts:
            title = post['data']['title'].lower()
            for word in word_list:
                if word.lower() in title.split():
                    if word.lower() in counts:
                        counts[word.lower()] += 1
                    else:
                        counts[word.lower()] = 1

        after = data['data']['after']
        if after:
            return _count_words_recursive(subreddit, word_list, after, counts)
        else:
            sorted_counts = sorted(counts.items(), key=lambda x: (-x[1], x[0]))
            for word, count in sorted_counts:
                print(f"{word}: {count}")
    except requests.exceptions.RequestException as e:
        pass

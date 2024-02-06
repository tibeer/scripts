import random


def get_vocal() -> str:
    values = "aeiou"
    return values[random.randrange(len(values))]


def get_consonant() -> str:
    values = "bcdfghkmnpqrstvwxyz"
    return values[random.randrange(len(values))]


print(f"{get_consonant()}{get_vocal()}{get_consonant()}{get_vocal()}")

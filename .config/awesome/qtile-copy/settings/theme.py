from os import path
import json

from settings.path import qtile_path


def load_theme():
    with open(path.join(qtile_path, "theme.json")) as f:
        return json.load(f)


if __name__ == "settings.theme":
    colors = load_theme()

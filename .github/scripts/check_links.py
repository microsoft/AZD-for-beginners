"""Check English Markdown/HTML links without opening generated translations."""

import argparse
from collections import defaultdict
from html.parser import HTMLParser
import json
from pathlib import Path
import re
import subprocess
import unicodedata
from urllib.parse import unquote, urlsplit, urlunsplit

import markdown


EXCLUDED = {"translations", "translated_images"}
EXTENSIONS = (
    "admonition",
    "attr_list",
    "tables",
    "pymdownx.details",
    "pymdownx.superfences",
    "pymdownx.tabbed",
)


def github_slug(text):
    return "".join(
        char
        for char in text.lower().replace(" ", "-")
        if char in "-_" or unicodedata.category(char)[0] in "LNM" or char == "\u200d"
    )


class Document(HTMLParser):
    def __init__(self, source):
        super().__init__()
        self.links = []
        self.ids = set()
        self.headings = []
        self.heading = None
        self.feed(markdown.markdown(source, extensions=list(EXTENSIONS)))
        used = set()
        for heading in self.headings:
            base = github_slug(heading)
            slug = base
            suffix = 0
            while slug in used:
                suffix += 1
                slug = f"{base}-{suffix}"
            used.add(slug)
            self.ids.add(slug)

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if attrs.get("id"):
            self.ids.add(attrs["id"])
        if tag == "a" and attrs.get("name"):
            self.ids.add(attrs["name"])
        key = {"a": "href", "img": "src"}.get(tag)
        if key and key in attrs:
            self.links.append(attrs[key] or "")
        if re.fullmatch(r"h[1-6]", tag):
            self.heading = []

    def handle_data(self, data):
        if self.heading is not None:
            self.heading.append(data)

    def handle_endtag(self, tag):
        if re.fullmatch(r"h[1-6]", tag) and self.heading is not None:
            self.headings.append("".join(self.heading))
            self.heading = None


def source_paths(root):
    result = subprocess.run(
        [
            "git", "ls-files", "-z", "--cached", "--others", "--exclude-standard",
            "--", "*.md", "*.html",
            ":(exclude)translations/**", ":(exclude)translated_images/**",
        ],
        cwd=root,
        capture_output=True,
        check=True,
    )
    return sorted(
        {
            root / name
            for name in result.stdout.decode("utf-8").split("\0")
            if name and not EXCLUDED.intersection(Path(name).parts)
        }
    )


def audit(root, paths):
    documents = {
        path.resolve(): Document(path.read_text(encoding="utf-8-sig"))
        for path in paths
        if not EXCLUDED.intersection(path.relative_to(root).parts)
    }
    broken = []
    external = defaultdict(list)
    checked = 0
    for path, document in documents.items():
        name = path.relative_to(root).as_posix()
        for value in document.links:
            if not value:
                broken.append({"file": name, "link": value, "kind": "empty"})
                continue
            url = urlsplit(value)
            if url.scheme in ("http", "https"):
                external[urlunsplit(url._replace(fragment=""))].append([name, value])
                continue
            if url.scheme or value.startswith("//"):
                continue
            target = unquote(url.path)
            if EXCLUDED.intersection(Path(target).parts):
                continue
            destination = (
                root / target.lstrip("/")
                if target.startswith("/")
                else path.parent / target if target else path
            ).resolve()
            checked += 1
            if not destination.is_relative_to(root):
                kind = "outside-repository"
            elif EXCLUDED.intersection(destination.relative_to(root).parts):
                continue
            elif not destination.exists():
                kind = "path"
            else:
                if destination.is_dir():
                    destination = next(
                        (destination / entry for entry in ("README.md", "index.md")
                         if (destination / entry).is_file()),
                        destination,
                    )
                anchor = unquote(url.fragment)
                if (
                    anchor
                    and destination in documents
                    and anchor not in documents[destination].ids
                    and anchor.removeprefix("user-content-") not in documents[destination].ids
                ):
                    kind = "anchor"
                else:
                    continue
            broken.append({"file": name, "link": value, "kind": kind})
    return {
        "files": len(documents),
        "local_links": checked,
        "broken": broken,
        "external": dict(external),
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json", type=Path, help="Write results and external URLs to JSON")
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[2]
    result = audit(root, source_paths(root))
    for item in result["broken"]:
        print(f'{item["file"]}: {item["kind"]}: {item["link"]!r}')
    print(
        f'{result["files"]} English files; {result["local_links"]} local links; '
        f'{len(result["broken"])} failures; {len(result["external"])} external URLs '
        "(not fetched by this offline check)."
    )
    if args.json:
        args.json.write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding="utf-8")
    return bool(result["broken"])


if __name__ == "__main__":
    raise SystemExit(main())

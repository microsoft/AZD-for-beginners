from pathlib import Path
import tempfile
import unittest

from check_links import Document, audit


class LinkTests(unittest.TestCase):
    def test_heading_ids_and_duplicate_collisions(self):
        doc = Document("# Hello\n# Hello-1\n# Hello\n# ⚙️ Configuration & Auth\n")
        self.assertTrue({"hello", "hello-1", "hello-2", "️-configuration--auth"} <= doc.ids)

    def test_real_links_not_code_or_comments(self):
        doc = Document(
            "[Reference][guide]\n\n[guide]: target.md\n\n"
            "```markdown\n[Example](missing.md)\n```\n\n"
            "<!-- [Hidden](hidden.md) -->\n\n"
            '!!! note\n\n    [Nested](nested.md)\n\n'
            '<a id="explicit"></a><img src="image.png">\n[Placeholder]()'
        )
        self.assertEqual(doc.links, ["target.md", "nested.md", "image.png", ""])
        self.assertIn("explicit", doc.ids)

    def test_paths_anchors_external_and_translation_exclusion(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory).resolve()
            home = root / "README.md"
            target = root / "other page.md"
            target.write_text("# A Heading\n", encoding="utf-8")
            home.write_text(
                "[Valid](other%20page.md#a-heading)\n"
                "[Missing](absent.md)\n"
                "[Anchor](other%20page.md#absent)\n"
                "[External](https://example.com/doc#heading)\n"
                "[Generated](translations/fr/README.md#absent)\n"
                "[Outside](../outside.md)\n"
                "[Empty]()\n",
                encoding="utf-8",
            )
            # A missing translation path must never be opened by the audit.
            result = audit(root, [home, target, root / "translations" / "absent.md"])
            self.assertEqual(result["files"], 2)
            self.assertEqual(
                [item["kind"] for item in result["broken"]],
                ["path", "anchor", "outside-repository", "empty"],
            )
            self.assertEqual(list(result["external"]), ["https://example.com/doc"])


if __name__ == "__main__":
    unittest.main()

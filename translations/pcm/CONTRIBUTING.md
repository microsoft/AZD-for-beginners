# How to Contribute to AZD For Beginners

Tanks for your interest to contribute to the AZD For Beginners course! Dis document dey give guidelines and info for contributors.

## How to Contribute

### How to Report Wahala

If you find bugs, errors, or get ideas to make am beta:

1. **Check Wetin Don Dey**: Search [existing issues](https://github.com/microsoft/azd-for-beginners/issues) to no create duplicate wahala
2. **Create New Issue**: Use di correct issue template
3. **Give Details**: Put the step to reproduce, wetin you expect, and screenshots if e dey

### How to Propose Changes

1. **Fork Di Repository**: Create your own fork of di project
2. **Create Branch**: Make feature branch for your changes
3. **Do Your Changes**: Follow di coding and documentation rules
4. **Test Your Changes**: Check say all links dey work and content dey show well
5. **Submit Pull Request**: Give clear explanation about your changes

### Types of Contributions

We dey welcome this kain contributions:

#### Content Improvements
- Fix typos, grammar, and formatting wahala
- Make existing documentation clear-pass
- Update information wey don chop old age
- Add explanations or context wey dey miss

#### New Examples
- Add real-world deployment palava
- Create new AZD templates for normal use
- Give extra code samples and exercises

#### Translation Help
- Help maintain existing translations
- Make translation quality beta
- Add translation for new content

#### Bug Reports
- Report broken links or wrong code examples
- Point out documentation palava
- Flag accessibility wahala

## Contribution Rules

### Documentation Standards

- Use clear, beginner-friendly language
- Include learning goals and results
- Give step-by-step instructions with expected outputs
- Add navigation links to related content
- Use consistent formatting and markdown style

### Code Examples

- Make sure all code examples dey tested and dey work
- Include comments wey explain key concepts
- Follow Azure and AZD best practices
- Provide expected output when e dey fit

### Validate English Documentation

From di repository root, install di existing development requirements and run:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

The offline link checker dey check English Markdown/HTML paths, headings, explicit anchors, and empty link placeholders. E no go check generated `translations/` and `translated_images/`, including links wey dey inside those directories. E no dey fetch external websites or check Azure deployments. Use `--json <report-path>` to export failures and external URL list for separate network check. Verify di current upstream commands and sample prerequisites when you dey change technical instructions; separate tested apps from design plans.

### Commit Messages

Use clear and descriptive commit messages:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Code of Conduct

Abeg read and follow our [Code of Conduct](CODE_OF_CONDUCT.md) to keep welcoming and inclusive community.

## How to Get Help

- **Questions**: Search or open [GitHub issue](https://github.com/microsoft/AZD-for-beginners/issues)
- **Community**: Join di [Azure Discord](https://discord.gg/microsoft-azure)
- **Documentation**: Check di [Azure Developer CLI docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## License

By contributing for this repository, you agree say your contribution go be licensed under di [MIT License](../../LICENSE).

---

Tanks for your help to make AZD For Beginners beta learning resource for di community!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
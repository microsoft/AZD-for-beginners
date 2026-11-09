# Pagsisid sa AZD Para sa mga Baguhan

Salamat sa iyong interes na makatulong sa kursong AZD Para sa mga Baguhan! Ang dokumentong ito ay nagbibigay ng mga alituntunin at impormasyon para sa mga kontribyutor.

## Paano Mag-ambag

### Pag-uulat ng Mga Isyu

Kung makakita ka ng mga bug, error, o may suhestiyon para sa pagpapabuti:

1. **Suriin ang mga Umiiral na Isyu**: Hanapin ang [umiiral na isyu](https://github.com/microsoft/azd-for-beginners/issues) upang maiwasan ang mga pag-uulit
2. **Lumikha ng Bagong Isyu**: Gamitin ang angkop na template ng isyu
3. **Magbigay ng Detalye**: Isama ang mga hakbang para mabawi, inaasahang gawi, at mga screenshot kung naaangkop

### Pagsusulong ng mga Pagbabago

1. **I-fork ang Repositoryo**: Gumawa ng sarili mong fork ng proyekto
2. **Lumikha ng Branch**: Gumawa ng feature branch para sa iyong mga pagbabago
3. **Gawin ang mga Pagbabago**: Sundan ang aming mga pamantayan sa coding at dokumentasyon
4. **Subukan ang Iyong mga Pagbabago**: Siguraduhing gumagana ang lahat ng mga link at naipapakita nang tama ang nilalaman
5. **Isumite ang Pull Request**: Magbigay ng malinaw na paglalarawan ng iyong mga pagbabago

### Mga Uri ng Ambag

Tinatanggap namin ang mga sumusunod na uri ng ambag:

#### Pagpapabuti ng Nilalaman
- Ayusin ang mga typographical errors, gramatika, at mga isyu sa pagformat
- Pahusayin ang kalinawan ng umiiral na dokumentasyon
- I-update ang mga lipas na impormasyon
- Magdagdag ng nawawalang pagpapaliwanag o konteksto

#### Mga Bagong Halimbawa
- Magdagdag ng mga tunay na senaryo ng deployment
- Gumawa ng mga bagong AZD template para sa mga karaniwang gamit
- Magbigay ng karagdagang mga code sample at mga ehersisyo

#### Suporta sa Pagsasalin
- Tumulong sa pagpapanatili ng mga umiiral na pagsasalin
- Pahusayin ang kalidad ng pagsasalin
- Magdagdag ng mga pagsasalin para sa bagong nilalaman

#### Mga Ulat ng Bug
- Iulat ang mga sirang link o maling halimbawa ng code
- Tukuyin ang mga inconsistency sa dokumentasyon
- I-flag ang mga isyu sa accessibility

## Mga Alituntunin sa Ambag

### Mga Pamantayan sa Dokumentasyon

- Gumamit ng malinaw, madaling maintindihan na wika para sa mga baguhan
- Isama ang mga layunin sa pag-aaral at mga resulta
- Magbigay ng mga hakbang-hakbang na tagubilin na may inaasahang output
- Magdagdag ng mga navigation link sa kaugnay na nilalaman
- Gumamit ng pare-parehong pagformat at estilo ng markdown

### Mga Halimbawa ng Code

- Siguraduhin na lahat ng halimbawa ng code ay nasubukan at gumagana
- Isama ang mga komento na nagpapaliwanag ng mga pangunahing konsepto
- Sundan ang pinakamahusay na gawi sa Azure at AZD
- Magbigay ng inaasahang output kung naaangkop

### Suriin ang English na Dokumentasyon

Mula sa root ng repository, i-install ang umiiral na mga pangangailangan sa pagdevelop at patakbuhin:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Sinusuri ng offline link checker ang mga English Markdown/HTML na path, mga heading, mga explicit anchor, at mga empty link placeholder. Hindi kasama ang mga generated `translations/` at `translated_images/`, kabilang ang mga link sa mga direktoryong iyon. Hindi nito kinukuha ang mga panlabas na website o sinusuri ang mga deployment ng Azure. Gamitin ang `--json <report-path>` upang i-export ang mga palpak at ang imbentaryo ng panlabas na URL para sa hiwalay na network check. Tiyakin ang kasalukuyang upstream commands at mga sample na kinakailangan kapag binabago ang mga teknikal na instruksiyon; tukuyin ang mga nasubok na aplikasyon mula sa mga disenyo o plano.

### Mga Mensahe ng Commit

Gumamit ng malinaw, malinaw na mga mensahe ng commit:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Kodigo ng Pag-uugali

Mangyaring basahin at sundin ang aming [Code of Conduct](CODE_OF_CONDUCT.md) upang mapanatili ang isang magiliw at inklusibong komunidad.

## Pagkuha ng Tulong

- **Mga Tanong**: Maghanap o magbukas ng [GitHub issue](https://github.com/microsoft/AZD-for-beginners/issues)
- **Komunidad**: Sumali sa [Azure Discord](https://discord.gg/microsoft-azure)
- **Dokumentasyon**: Suriin ang [Azure Developer CLI docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Lisensya

Sa pamamagitan ng pag-aambag sa repositoryong ito, sumasang-ayon kang ang iyong mga ambag ay lisensyado sa ilalim ng [MIT License](../../LICENSE).

---

Salamat sa pagtulong gawing mas mabuting mapagkukunan ng pag-aaral ang AZD Para sa mga Baguhan para sa komunidad!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
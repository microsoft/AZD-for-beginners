# Az AZD For Beginners-hoz való hozzájárulás

Köszönjük érdeklődésedet az AZD For Beginners tanfolyamhoz való hozzájárulás iránt! Ez a dokumentum irányelveket és információkat nyújt a közreműködők számára.

## Hogyan járulhatsz hozzá

### Hibák jelentése

Ha hibákat, tévedéseket találsz, vagy javítási javaslataid vannak:

1. **Ellenőrizd a meglévő hibákat**: Keresd meg a [meglévő hibákat](https://github.com/microsoft/azd-for-beginners/issues), hogy elkerüld az ismétléseket
2. **Hozz létre új hibajegyet**: Használd a megfelelő hibajegy sablont
3. **Adj meg részleteket**: Tartalmazza a reprodukálási lépéseket, a várható viselkedést és ha szükséges, képernyőképeket

### Változtatások javaslata

1. **Forkold a tárolót**: Hozd létre a saját forkodat a projektről
2. **Hozz létre egy ágat**: Készíts egy funkcióágat a változtatásokhoz
3. **Végezze el a változtatásokat**: Kövesd a kódolási és dokumentációs szabványaikat
4. **Teszteld a változtatásokat**: Ellenőrizd, hogy minden link működik és a tartalom megfelelően jelenik meg
5. **Nyújts be Pull Request-et**: Adj világos leírást a változtatásaidról

### Hozzájárulás típusai

Az alábbi hozzájárulásokat várjuk szívesen:

#### Tartalomfejlesztések
- Hibák, helyesírási, nyelvtani és formázási hibák javítása
- A meglévő dokumentáció tisztázása
- Elavult információk frissítése
- Hiányzó magyarázatok vagy kontextus hozzáadása

#### Új példák
- Valós telepítési forgatókönyvek hozzáadása
- Új AZD sablonok készítése gyakori használati esetekhez
- További kódpéldák és gyakorlatok biztosítása

#### Fordítási támogatás
- A meglévő fordítások karbantartásának segítése
- A fordítások minőségének javítása
- Új tartalmak fordításának hozzáadása

#### Hibabejelentés
- Törött linkek vagy helytelen kódpéldák jelentése
- A dokumentációs inkonzisztenciák azonosítása
- Hozzáférhetőségi problémák jelzése

## Hozzájárulási irányelvek

### Dokumentációs szabványok

- Használj világos, kezdők számára barátságos nyelvezetet
- Tartalmazzon tanulási célokat és eredményeket
- Lépésről lépésre instrukciókat adj meg a várható eredményekkel
- Adj navigációs linkeket a kapcsolódó tartalomhoz
- Használj következetes formázást és markdown stílust

### Kódpéldák

- Biztosítsd, hogy az összes kódpélda tesztelt és működőképes legyen
- Magyarázó megjegyzéseket tartalmazzon a kulcsfogalmakról
- Kövesd az Azure és az AZD legjobb gyakorlatait
- Ha alkalmazható, adj meg várható kimenetet is

### Az angol dokumentáció validálása

A tároló gyökérkönyvtárából telepítsd a meglévő fejlesztési követelményeket és futtasd:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Az offline linkellenőrző ellenőrzi az angol Markdown/HTML útvonalakat, címsorokat, explicit horgonyokat és az üres linkhelyeket. Kizárja a generált `translations/` és `translated_images/` tartalmakat, valamint a hozzájuk vezető linkeket. Nem tölti le külső webhelyeket és nem ellenőrzi az Azure telepítéseket. Használd a `--json <report-path>` parancsot a hibák és a külső URL-állomány exportálásához külön hálózati ellenőrzéshez. Módosítások esetén ellenőrizd a jelenlegi upstream parancsokat és a minta előfeltételeit; különböztesd meg a tesztelt alkalmazásokat a tervezési tervektől.

### Commit üzenetek

Használj világos, leíró commit üzeneteket:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Magatartási kódex

Kérjük, olvasd el és kövesd a [Magatartási kódexünket](CODE_OF_CONDUCT.md), hogy egy befogadó és barátságos közösséget tartsunk fenn.

## Segítség kérése

- **Kérdések**: Keress vagy hozz létre egy [GitHub hibajegyet](https://github.com/microsoft/AZD-for-beginners/issues)
- **Közösség**: Csatlakozz az [Azure Discordhoz](https://discord.gg/microsoft-azure)
- **Dokumentáció**: Tekintsd meg az [Azure Developer CLI dokumentációt](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licenc

Az ebbe a tárolóba való hozzájárulással elfogadod, hogy a hozzájárulásaid a [MIT licenc](../../LICENSE) alatt lesznek licencelve.

---

Köszönjük, hogy segítesz jobb tanulási erőforrást létrehozni az AZD For Beginners számára a közösségnek!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
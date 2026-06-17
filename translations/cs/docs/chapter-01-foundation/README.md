# Kapitola 1: Základy & Rychlý start

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Délka**: 30-45 minut | **⭐ Složitost**: Začátečník

---

## Přehled

Tato kapitola představuje základy Azure Developer CLI (azd). Naučíte se základní pojmy, nainstalujete nástroje a nasadíte svou první aplikaci do Azure.

> Ověřeno proti `azd 1.25.6` v červnu 2026.

## Cíle učení

Po dokončení této kapitoly budete:
- Rozumět tomu, co je Azure Developer CLI a jak se liší od Azure CLI
- Nainstalovat a nakonfigurovat AZD na vaší platformě
- Nasadit svou první aplikaci do Azure pomocí `azd up`
- Odstranit zdroje pomocí `azd down`

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Základy AZD](azd-basics.md) | Základní koncepty, terminologie a struktura projektu | 15 min |
| 2 | [Instalace & Nastavení](installation.md) | Instalace specifická pro platformu | 10 min |
| 3 | [Váš první projekt](first-project.md) | Prakticky: Nasazení webové aplikace do Azure | 20 min |
| 4 | [Přidejte vlastní aplikaci](bring-your-own-app.md) | Přidání azd do existujícího projektu, který již máte | 15 min |
| 5 | [Vývojové kontejnery & Codespaces](dev-containers.md) | Reprodukovatelné prostředí azd pomocí vývojových kontejnerů | 15 min |

---

## ✅ Začněte zde: Ověřte své nastavení

Než začnete, potvrďte, že je váš lokální počítač připraven pro šablonu Kapitoly 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Pokud skript hlásí chybějící nástroje, opravte je nejdříve a pak pokračujte v kapitole.

---

## 🚀 Rychlý start

```bash
# Zkontrolujte instalaci
azd version

# Autentizujte se pro AZD
# Volitelné: az login, pokud plánujete spouštět příkazy Azure CLI přímo
azd auth login

# Nasazení vaší první aplikace
azd init --template todo-nodejs-mongo
azd up

# Vyčistěte po dokončení
azd down --force --purge
```

---

## ✅ Kritéria úspěchu

Po dokončení této kapitoly byste měli být schopni:

```bash
azd version              # Zobrazuje nainstalovanou verzi
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                   # Nasazuje do Azure
azd show                 # Zobrazuje URL spuštěné aplikace
azd down --force --purge # Uvolňuje prostředky
```

---

## 🔗 Navigace

| Direction | Chapter |
|-----------|---------|
| **Další** | [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/README.md) |
| **Přeskočit na** | [Kapitola 3: Konfigurace](../chapter-03-configuration/README.md) |

---

## 📖 Související zdroje

- [Přehled příkazů](../../resources/cheat-sheet.md)
- [Často kladené otázky](../../resources/faq.md)
- [Glosář](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
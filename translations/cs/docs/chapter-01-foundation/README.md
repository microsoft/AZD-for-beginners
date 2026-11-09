# Kapitola 1: Základy a Rychlý start

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 75-120 minut včetně prvního nasazení; další cvičení zabere více času | **⭐ Složitost**: Začátečník

---

## Přehled

Tato kapitola představuje základy Azure Developer CLI (azd). Naučíte se základní koncepty, nainstalujete nástroje a nasadíte první aplikaci do Azure.

> Cíl přezkoumání příkazů a konfigurace: `azd 1.37.2` (listopad 2026). Při přezkoumání nebylo provedeno živé nasazení Azure.

## Výukové cíle

Po dokončení této kapitoly budete umět:
- Pochopit, co je Azure Developer CLI a jak se liší od Azure CLI
- Nainstalovat a nakonfigurovat AZD na vaší platformě
- Nasadit první aplikaci do Azure pomocí `azd up`
- Uklidit prostředky pomocí `azd down`

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Základy AZD](azd-basics.md) | Základní koncepty, terminologie a struktura projektu | 15 min |
| 2 | [Instalace a nastavení](installation.md) | Průvodce instalací pro různé platformy | 10 min |
| 3 | [Váš první projekt](first-project.md) | Prakticky: Nasazení webové aplikace do Azure | 20 min |
| 4 | [Přidání vaší vlastní aplikace](bring-your-own-app.md) | Přidání azd do existujícího projektu, který už máte | 15 min |
| 5 | [Vývojové kontejnery a Codespaces](dev-containers.md) | Reprodukovatelné prostředí azd pomocí vývojových kontejnerů | 15 min |

---

## ✅ Začněte zde: Ověřte své nastavení

Než začnete, ověřte, že váš lokální počítač je připraven pro šablonu Kapitoly 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Pokud skript hlásí chybějící nástroje, nejprve je nainstalujte a poté pokračujte v kapitole.

---

## 🚀 Rychlý start

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Kritéria úspěchu

Po dokončení této kapitoly byste měli být schopni:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Další** | [Kapitola 2: Vývoj s AI na prvním místě](../chapter-02-ai-development/README.md) |
| **Přeskočit na** | [Kapitola 3: Konfigurace](../chapter-03-configuration/README.md) |

---

## 📖 Související zdroje

- [Příručka příkazů](../../resources/cheat-sheet.md)
- [Často kladené dotazy](../../resources/faq.md)
- [Glosář](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
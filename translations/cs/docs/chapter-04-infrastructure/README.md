# Kapitola 4: Infrastruktura jako kód a nasazení

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Délka**: 1–1,5 hodiny | **⭐ Obtížnost**: Středně pokročilý

---

## Přehled

Tato kapitola pokrývá vzory Infrastructure as Code (IaC) s Bicep šablonami, provisioning zdrojů a strategie nasazení pomocí Azure Developer CLI.

> Validováno na `azd 1.23.12` v březnu 2026.

## Výukové cíle

Po dokončení této kapitoly budete:
- Rozumět struktuře a syntaxi Bicep šablon
- Provádět provisioning Azure zdrojů pomocí `azd provision`
- Nasazovat aplikace pomocí `azd deploy`
- Implementovat strategie nasazení blue-green a rolling

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Provisioning zdrojů](provisioning.md) | Správa Azure zdrojů pomocí AZD | 45 min |
| 2 | [Průvodce nasazením](deployment-guide.md) | Strategie nasazení aplikací | 45 min |

---

## 🚀 Rychlý start

```bash
# Inicializovat z šablony
azd init --template azure-functions-python-v2-http

# Náhled toho, co bude vytvořeno
azd provision --preview

# Zajistit infrastrukturu pouze
azd provision

# Nasadit pouze kód
azd deploy

# Nebo obojí společně
azd up
```

---

## 📁 Struktura projektu AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Základní příkazy

| Příkaz | Popis |
|---------|-------------|
| `azd init` | Inicializace projektu |
| `azd provision` | Vytvoření Azure zdrojů |
| `azd deploy` | Nasazení kódu aplikace |
| `azd up` | provisioning + nasazení |
| `azd down` | Odstranění všech zdrojů |

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 3: Konfigurace](../chapter-03-configuration/README.md) |
| **Další** | [Kapitola 5: Víceagentní řešení](../chapter-05-multi-agent/README.md) |

---

## 📖 Související zdroje

- [Kontroly před nasazením](../chapter-06-pre-deployment/README.md)
- [Příklady Container App](../../examples/container-app/README.md)
- [Příklad aplikace databáze](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:  
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro zásadní informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
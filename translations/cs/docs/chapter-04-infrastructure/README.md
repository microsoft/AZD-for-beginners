# Chapter 4: Infrastructure as Code & Deployment

**📚 Course**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 1-1,5 hodiny | **⭐ Složitost**: Středně pokročilá

---

## Přehled

Tato kapitola pokrývá vzory Infrastructure as Code (IaC) se šablonami Bicep, provisioning zdrojů a strategie nasazení pomocí Azure Developer CLI.

> Ověřeno s `azd 1.25.6` v červnu 2026.

## Učební cíle

Po dokončení této kapitoly budete:
- Rozumět struktuře a syntaxi šablon Bicep
- Provisionovat Azure zdroje pomocí `azd provision`
- Nasazovat aplikace pomocí `azd deploy`
- Implementovat blue-green a rolling strategie nasazení

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Správa Azure zdrojů pomocí AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Strategie nasazení aplikací | 45 min |
| 3 | [Authoring Your Own Template](custom-templates.md) | Vytvoření a publikování znovupoužitelných šablon azd | 30 min |

---

## 🚀 Rychlý start

```bash
# Inicializovat z šablony
azd init --template azure-functions-python-v2-http

# Zobrazit náhled toho, co bude vytvořeno
azd provision --preview

# Zajistit pouze infrastrukturu
azd provision

# Nasadit pouze kód
azd deploy

# Nebo obojí najednou
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
| `azd init` | Inicializovat projekt |
| `azd provision` | Vytvořit Azure zdroje |
| `azd deploy` | Nasadit kód aplikace |
| `azd up` | vytvoření zdrojů + nasazení |
| `azd down` | Smazat všechny zdroje |

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
- [Příklad databázové aplikace](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
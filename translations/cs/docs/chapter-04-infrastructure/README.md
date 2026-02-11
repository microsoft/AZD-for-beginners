# Kapitola 4: Infrastruktura jako kód & Nasazení

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Doba trvání**: 1-1.5 hodiny | **⭐ Složitost**: Střední

---

## Přehled

Tato kapitola pokrývá vzory Infrastruktury jako kód (IaC) s Bicep šablonami, vytváření prostředků a strategie nasazení za použití Azure Developer CLI.

## Cíle učení

Po dokončení této kapitoly budete:
- Porozumět struktuře a syntaxi šablon Bicep
- Vytvořit prostředky v Azure pomocí `azd provision`
- Nasadit aplikace pomocí `azd deploy`
- Implementovat blue-green a rolling strategie nasazení

---

## 📚 Lekce

| # | Lekce | Popis | Doba |
|---|--------|-------------|------|
| 1 | [Vytváření prostředků](provisioning.md) | Správa Azure prostředků pomocí AZD | 45 min |
| 2 | [Průvodce nasazením](deployment-guide.md) | Strategie nasazení aplikací | 45 min |

---

## 🚀 Rychlý start

```bash
# Inicializovat z šablony
azd init --template azure-functions-python-v2-http

# Náhled toho, co bude vytvořeno
azd provision --preview

# Pouze zřídit infrastrukturu
azd provision

# Pouze nasadit kód
azd deploy

# Nebo obojí dohromady
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
| `azd provision` | Vytvořit prostředky v Azure |
| `azd deploy` | Nasadit kód aplikace |
| `azd up` | provision + nasazení |
| `azd down` | Odstranit všechny prostředky |

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
Prohlášení o vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí překladatelské služby založené na umělé inteligenci [Co-op Translator](https://github.com/Azure/co-op-translator). Snažíme se o přesnost, nicméně mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace doporučujeme využít profesionální lidský překlad. Nezodpovídáme za žádná nedorozumění nebo chybné výklady vzniklé v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
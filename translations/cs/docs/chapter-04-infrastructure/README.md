# Kapitola 4: Infrastruktura jako kód a nasazení

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Délka**: 2-3 hodiny čtení; vyhraďte si více času na cvičení s nasazením | **⭐ Složitost**: Středně pokročilý

---

## Přehled

Tato kapitola pokrývá vzory Infrastruktury jako kódu (IaC) s šablonami Bicep, poskytování zdrojů a strategie nasazení pomocí Azure Developer CLI.

> Cíl přezkumu příkazů a konfigurací: `azd 1.37.2` (listopad 2026). Naživo nebylo během přezkumu provedeno poskytování služby Azure.

## Cíle učení

Po dokončení této kapitoly budete:
- Rozumět struktuře a syntaxi šablon Bicep
- Poskytovat zdroje Azure s použitím `azd provision`
- Nasazovat aplikace pomocí `azd deploy`
- Implementovat strategie modrozeleného (blue-green) a postupného (rolling) nasazení

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Zajištění zdrojů](provisioning.md) | Správa zdrojů Azure s AZD | 45 min |
| 2 | [Průvodce nasazením](deployment-guide.md) | Strategie nasazení aplikací | 45 min |
| 3 | [Vytváření vlastní šablony](custom-templates.md) | Vytváření a publikování opakovaně použitelných azd šablon | 30 min |

---

## 🚀 Rychlý start

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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
| `azd provision` | Vytvořit zdroje Azure |
| `azd deploy` | Nasadit kód aplikace |
| `azd up` | poskytování + nasazení |
| `azd down` | Odstranit všechny zdroje |

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 3: Konfigurace](../chapter-03-configuration/README.md) |
| **Další** | [Kapitola 5: Víceagentní řešení](../chapter-05-multi-agent/README.md) |

---

## 📖 Související zdroje

- [Kontroly před nasazením](../chapter-06-pre-deployment/README.md)
- [Příklady kontejnerových aplikací](../../examples/container-app/README.md)
- [Příklad databázové aplikace](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->